import '../../../../core/network/net_result.dart';

abstract class HomeRepository {
  Future<Result> fetchCurrencyList();
}
