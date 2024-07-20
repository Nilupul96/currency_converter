part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrencyList extends HomeEvent {}

class SetSelectedCurrencyList extends HomeEvent {
  final List<String> currencyCodeList;

  const SetSelectedCurrencyList(this.currencyCodeList);
}

class FetchCurrencyRates extends HomeEvent {
  final List<String> currencyCodeList;
  final String baseCurrency;

  const FetchCurrencyRates(this.currencyCodeList, this.baseCurrency);
}

class SaveBaseCurrency extends HomeEvent {
  final String baseCurrency;
  const SaveBaseCurrency(this.baseCurrency);
}

class GetBaseCurrency extends HomeEvent {}
