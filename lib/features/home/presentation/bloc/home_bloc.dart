import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'package:currency_converter/features/home/domain/entities/currency_rates.dart';
import 'package:currency_converter/features/home/domain/usecases/convert_currency_usecase.dart';
import 'package:currency_converter/features/home/domain/usecases/fetch_currency_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_result.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchCurrencyListUseCase _fetchCurrencyListUseCase;
  final ConvertCurrencyUseCase _convertCurrencyUseCase;
  HomeBloc(this._fetchCurrencyListUseCase, this._convertCurrencyUseCase)
      : super(HomeInitial()) {
    on<FetchCurrencyList>(_fetchCurrencyList);
    on<SetSelectedCurrencyList>(_setSelectedCurrencyList);
    on<ConvertCurrency>(_convertCurrency);
  }

  void _fetchCurrencyList(
      FetchCurrencyList event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    Result result = await _fetchCurrencyListUseCase.call();
    if (result.exception != null) {
      emit(HomeError(error: result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(HomeSuccess(
          currencyList: result.result,
          selectedCurrencyCode: [],
          currencyRates: []));
    }
  }

  void _setSelectedCurrencyList(
      SetSelectedCurrencyList event, Emitter<HomeState> emit) async {
    emit(HomeSuccess(
        currencyList: (state as HomeSuccess).currencyList,
        selectedCurrencyCode: event.currencyCodeList,
        currencyRates: (state as HomeSuccess).currencyRates));
  }

  void _convertCurrency(ConvertCurrency event, Emitter<HomeState> emit) async {
    Result result = await _convertCurrencyUseCase.call(
        params: ConvertCurrencyParams(
            baseCurrency: event.baseCurrency,
            convertCurrencyCodes: event.currencyCodeList));
    if (result.exception != null) {
      emit(HomeError(error: result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(
        HomeSuccess(
            currencyList: (state as HomeSuccess).currencyList,
            currencyRates: result.result,
            selectedCurrencyCode: (state as HomeSuccess).selectedCurrencyCode),
      );
    }
  }
}
