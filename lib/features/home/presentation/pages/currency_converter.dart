import 'package:currency_converter/core/app_const.dart';
import 'package:currency_converter/core/widgets/main_btn.dart';
import 'package:currency_converter/core/widgets/main_text_field.dart';
import 'package:currency_converter/features/home/presentation/pages/currency_list_screen.dart';
import 'package:currency_converter/features/home/presentation/widgets/converted_currency_List_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/helpers/app_logger.dart';
import '../bloc/home_bloc.dart';
import '../widgets/country_picker.dart';

class CurrencyConverterScreen extends StatefulWidget {
  static const routeName = "/currency-converter-screen";
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _currencyController = TextEditingController();
  String baseCurrencyCode = AppConst.INITIAL_CURRENCY_CODE;

  @override
  void initState() {
    super.initState();
    loadInitialValues();
  }

  loadInitialValues() {
    HomeSuccess state = context.read<HomeBloc>().state as HomeSuccess;
    fetchCurrencyRates(state.selectedCurrencyCode);
    baseCurrencyCode = state.baseCurrency ?? AppConst.INITIAL_CURRENCY_CODE;
  }

  void fetchCurrencyRates(List<String> currencyList) {
    context
        .read<HomeBloc>()
        .add(FetchCurrencyRates(currencyList, baseCurrencyCode));
  }

  double getRate(String code, HomeSuccess state) {
    try {
      return state.currencyRates
          .firstWhere((element) => element.currencyCode == code)
          .rate;
    } catch (e) {
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        Log.info(state.toString());
      }, builder: (context, state) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RSizedBox(
                  height: 40,
                ),
                Text(
                  'Insert Amount:',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const RSizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    labelText: "Amount",
                    keyboardType: TextInputType.number,
                    textEditingController: _currencyController,
                    hintText: "Please Insert Amount",
                    onChanged: (value) {
                      setState(() {});
                    },
                    suffixIcon: CountryPickerComponent(
                      currencyCode: baseCurrencyCode,
                      onValuePicked: (country) {
                        setState(() {
                          if (country != null) {
                            baseCurrencyCode = country.currencyCode ??
                                AppConst.INITIAL_CURRENCY_CODE;
                          }
                          context
                              .read<HomeBloc>()
                              .add(SaveBaseCurrency(baseCurrencyCode));
                          fetchCurrencyRates(
                              (state as HomeSuccess).selectedCurrencyCode);
                        });
                      },
                    )),
                const RSizedBox(
                  height: 40,
                ),
                Text(
                  'Convert To:',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const RSizedBox(
                  height: 10,
                ),
                if (state is HomeSuccess && state.selectedCurrencyCode.isEmpty)
                  const RSizedBox(
                      height: 100,
                      child: Center(child: Text("No selected converters"))),
                if (state is HomeSuccess)
                  ListView.builder(
                      itemCount: state.selectedCurrencyCode.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ConvertedCurrencyListTile(
                          currencyCode: state.selectedCurrencyCode[index],
                          value: _currencyController.text.isEmpty
                              ? '0'
                              : (double.parse(_currencyController.text.trim()) *
                                      getRate(state.selectedCurrencyCode[index],
                                          state))
                                  .toStringAsFixed(2),
                          onCountryPicked: (country) {
                            state.selectedCurrencyCode[index] =
                                country!.currencyCode!;
                            fetchCurrencyRates(state.selectedCurrencyCode);
                          },
                        );
                      }),
                const RSizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 200.w,
                    child: MainBtn(
                        lbl: "Add Converter",
                        bgColor: AppColors.lightGreen.withOpacity(0.4),
                        icon: const Icon(Icons.add),
                        onClick: () async {
                          context.pushNamed(CurrencyListScreen.routeName,
                              extra: baseCurrencyCode);
                        }),
                  ),
                ),
                const RSizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
