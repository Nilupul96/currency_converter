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

class CurrencyConverterScreen extends StatefulWidget {
  static const routeName = "/currency-converter-screen";
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        Log.info(state.toString());
      }, builder: (context, state) {
        if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is HomeSuccess) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    ),
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
                    if (state.selectedCurrencyCode.isEmpty)
                      RSizedBox(
                          height: 100,
                          child: Center(
                              child: Text(
                                  "No selected converters ${state.selectedCurrencyCode}"))),
                    ListView.builder(
                        itemCount: state.selectedCurrencyCode.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return const ConvertedCurrencyListTile();
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
                              context.pushNamed(CurrencyListScreen.routeName);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox();
      }),
    );
  }
}
