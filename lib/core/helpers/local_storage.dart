// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import 'app_logger.dart';

class LocalStorage {
  static final LocalStorage _singleton = LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal();

  static String get BASE_CURRENCY => "com.currency-converter.app.base_currency";
  static String get SELECTED_CURRENCY =>
      "com.currency-converter.app.selected-currency";

  Future<String?> getBaseCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(BASE_CURRENCY);
  }

  Future<void> saveBaseCurrency(String currency) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(BASE_CURRENCY, currency);
    Log.info("$currency save in local");
  }

  Future<List<String>?> getSelectedCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(SELECTED_CURRENCY);
  }

  Future<void> saveSelectedCurrencyList(List<String> currencyList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(SELECTED_CURRENCY, currencyList);
    Log.info("$currencyList save in local");
  }
}
