import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_logger.dart';
import '../bloc/home_bloc.dart';
import '../widgets/currency_list_tile.dart';

class CurrencyListScreen extends StatefulWidget {
  final String baseCurrencyCode;
  static const routeName = "/currency-list-screen";
  const CurrencyListScreen({super.key, required this.baseCurrencyCode});

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  List<String> selectedCurrencyList = [];

  @override
  void initState() {
    setInitialSelectedCurrency();
    super.initState();
  }

  void setInitialSelectedCurrency() {
    selectedCurrencyList.addAll(
        (context.read<HomeBloc>().state as HomeSuccess).selectedCurrencyCode);
    setState(() {});
  }

  Future<void> fetchCurrencyRates() async {
    context.read<HomeBloc>().add(SetSelectedCurrencyList(selectedCurrencyList));
    context
        .read<HomeBloc>()
        .add(FetchCurrencyRates(selectedCurrencyList, widget.baseCurrencyCode));
    Log.debug('Saved currency list --$selectedCurrencyList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency List'),
          actions: [
            IconButton(
                onPressed: () => fetchCurrencyRates(),
                icon: const Icon(Icons.done))
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeSuccess) {
              return ListView.builder(
                  itemCount: state.currencyList.length,
                  itemBuilder: (context, int index) {
                    return CurrencyListTile(
                      currency: state.currencyList[index],
                      isSelected: selectedCurrencyList
                          .contains(state.currencyList[index].code),
                      onSelect: (value) {
                        setState(() {
                          if (value) {
                            selectedCurrencyList
                                .add(state.currencyList[index].code);
                          } else {
                            selectedCurrencyList
                                .remove(state.currencyList[index].code);
                          }
                        });
                      },
                    );
                  });
            }
            return const SizedBox();
          },
        ));
  }
}
