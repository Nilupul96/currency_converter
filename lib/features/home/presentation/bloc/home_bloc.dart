import 'package:currency_converter/core/helpers/local_storage.dart';
import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'package:currency_converter/features/home/domain/entities/currency_rates.dart';
import 'package:currency_converter/features/home/domain/usecases/fetch_cuurency_rates_usecase.dart';
import 'package:currency_converter/features/home/domain/usecases/fetch_currency_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/net_result.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchCurrencyListUseCase _fetchCurrencyListUseCase;
  final FetchCurrencyRatesUseCase _convertCurrencyUseCase;
  HomeBloc(this._fetchCurrencyListUseCase, this._convertCurrencyUseCase)
      : super(HomeInitial()) {
    on<FetchCurrencyList>(_fetchCurrencyList);
    on<SetSelectedCurrencyList>(_setSelectedCurrencyList);
    on<FetchCurrencyRates>(_fetchCurrencyRates);
    on<SaveBaseCurrency>(_saveBaseCurrency);
    on<RemoveCurrency>(_removeCurrency);
  }

  void _fetchCurrencyList(
      FetchCurrencyList event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    Result result = await _fetchCurrencyListUseCase.call();
    List<String>? selectedCurrencyList =
        await LocalStorage().getSelectedCurrency();
    String? baseCurrency = await LocalStorage().getBaseCurrency();
    if (result.exception != null) {
      emit(HomeError(error: result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(HomeSuccess(
          currencyList: result.result,
          selectedCurrencyCode: selectedCurrencyList ?? [],
          baseCurrency: baseCurrency,
          currencyRates: const []));
    }
  }

  void _setSelectedCurrencyList(
      SetSelectedCurrencyList event, Emitter<HomeState> emit) async {
    emit(HomeSuccess(
        currencyList: (state as HomeSuccess).currencyList,
        baseCurrency: (state as HomeSuccess).baseCurrency,
        selectedCurrencyCode: event.currencyCodeList,
        currencyRates: (state as HomeSuccess).currencyRates));
    LocalStorage().saveSelectedCurrencyList(event.currencyCodeList);
  }

  void _fetchCurrencyRates(
      FetchCurrencyRates event, Emitter<HomeState> emit) async {
    // emit(FetchCurrencyRatesLoading());
    Result result = await _convertCurrencyUseCase.call(
        params: FetchCurrencyRatesParams(
            baseCurrency: event.baseCurrency,
            convertCurrencyCodes: event.currencyCodeList));
    if (result.exception != null) {
      emit(HomeError(error: result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(
        HomeSuccess(
            currencyList: (state as HomeSuccess).currencyList,
            baseCurrency: (state as HomeSuccess).baseCurrency,
            currencyRates: result.result,
            selectedCurrencyCode: (state as HomeSuccess).selectedCurrencyCode),
      );
    }
  }

  void _saveBaseCurrency(
      SaveBaseCurrency event, Emitter<HomeState> emit) async {
    await LocalStorage().saveBaseCurrency(event.baseCurrency);
  }

  _removeCurrency(RemoveCurrency event, Emitter<HomeState> emit) {
    List<String> selectedCurrency = (state as HomeSuccess).selectedCurrencyCode;
    selectedCurrency.remove(event.currencyCode);

    print(selectedCurrency);
    emit(
      HomeSuccess(
          currencyList: (state as HomeSuccess).currencyList,
          baseCurrency: (state as HomeSuccess).baseCurrency,
          currencyRates: (state as HomeSuccess).currencyRates,
          selectedCurrencyCode: selectedCurrency),
    );
    LocalStorage()
        .saveSelectedCurrencyList((state as HomeSuccess).selectedCurrencyCode);
  }
}
