import 'package:currency_converter/core/network/net_result.dart';
import 'package:currency_converter/features/home/data/datasources/home_service.dart';
import 'package:currency_converter/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _homeService;

  HomeRepositoryImpl(this._homeService);
  @override
  Future<Result> fetchCurrencyList() async {
    return await _homeService.fetchCurrencyList();
  }
}
