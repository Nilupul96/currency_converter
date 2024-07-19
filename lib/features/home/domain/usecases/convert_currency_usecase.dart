import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class ConvertCurrencyUseCase implements UseCase<Result, ConvertCurrencyParams> {
  final HomeRepository _homeRepository;

  ConvertCurrencyUseCase(this._homeRepository);
  @override
  Future<Result> call({ConvertCurrencyParams? params}) async {
    return await _homeRepository.convertCurrency(
        baseCurrency: params!.baseCurrency,
        convertCurrencyCodes: params.convertCurrencyCodes);
  }
}

class ConvertCurrencyParams {
  final String baseCurrency;
  final List<String> convertCurrencyCodes;

  ConvertCurrencyParams(
      {required this.baseCurrency, required this.convertCurrencyCodes});
}
