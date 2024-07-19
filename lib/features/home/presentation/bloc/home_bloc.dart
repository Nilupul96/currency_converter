import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'package:currency_converter/features/home/domain/usecases/fetch_currency_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/net_result.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchCurrencyListUseCase _fetchCurrencyListUseCase;
  HomeBloc(this._fetchCurrencyListUseCase) : super(HomeInitial()) {
    on<FetchCurrencyList>(_fetchCurrencyList);
  }

  void _fetchCurrencyList(
      FetchCurrencyList event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    Result result = await _fetchCurrencyListUseCase.call();
    if (result.exception != null) {
      emit(HomeError(error: result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(HomeSuccess(currencyList: result.result));
    }
  }
}
