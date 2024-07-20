import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class FetchCurrencyListUseCase implements UseCase<Result, void> {
  final HomeRepository _homeRepository;

  FetchCurrencyListUseCase(this._homeRepository);
  @override
  Future<Result> call({void params}) async {
    return await _homeRepository.fetchCurrencyList();
  }
}
