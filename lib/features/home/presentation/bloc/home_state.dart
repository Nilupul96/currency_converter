part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Currency> currencyList;
  final List<String> selectedCurrencyCode;
  final List<CurrencyRate> currencyRates;
  final String? baseCurrency;

  const HomeSuccess(
      {required this.currencyList,
      required this.selectedCurrencyCode,
      this.baseCurrency,
      required this.currencyRates});
  @override
  List<Object> get props =>
      [currencyList, selectedCurrencyCode, currencyRates, baseCurrency!];
}

class HomeError extends HomeState {
  final String error;

  const HomeError({required this.error});
}

class CurrencyConverting extends HomeState {}

class FetchCurrencyRatesLoading extends HomeState {}
