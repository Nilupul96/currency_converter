import 'package:flutter/material.dart';
import '../../../../core/app_const.dart';
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
        body: ListView.builder(
            itemCount: AppConst.AVAILABLE_CURRENCY_CODE_LIST.length,
            itemBuilder: (context, int index) {
              return CurrencyListTile(
                currency: AppConst.AVAILABLE_CURRENCY_CODE_LIST[index],
              );
            }));
  }
}
