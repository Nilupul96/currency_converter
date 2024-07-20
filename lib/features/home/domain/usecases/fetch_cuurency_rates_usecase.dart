import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class FetchCurrencyRatesUseCase
    implements UseCase<Result, FetchCurrencyRatesParams> {
  final HomeRepository _homeRepository;

  FetchCurrencyRatesUseCase(this._homeRepository);
  @override
  Future<Result> call({FetchCurrencyRatesParams? params}) async {
    return await _homeRepository.fetchCurrencyRates(
        baseCurrency: params!.baseCurrency,
        convertCurrencyCodes: params.convertCurrencyCodes);
  }
}

class FetchCurrencyRatesParams {
  final String baseCurrency;
  final List<String> convertCurrencyCodes;

  FetchCurrencyRatesParams(
      {required this.baseCurrency, required this.convertCurrencyCodes});
}
