import '../../../../core/network/net_result.dart';

abstract class HomeRepository {
  Future<Result> fetchCurrencyList();
  Future<Result> fetchCurrencyRates(
      {required String baseCurrency,
      required List<String> convertCurrencyCodes});
}
