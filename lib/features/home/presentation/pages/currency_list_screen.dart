import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/currency_list_tile.dart';

class CurrencyListScreen extends StatefulWidget {
  static const routeName = "/currency-list-screen";
  const CurrencyListScreen({super.key});

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency List'),
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
                    );
                  });
            }
            return const SizedBox();
          },
        ));
  }
}
