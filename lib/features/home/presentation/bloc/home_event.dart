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

class ConvertCurrency extends HomeEvent {
  final List<String> currencyCodeList;
  final String baseCurrency;

  const ConvertCurrency(this.currencyCodeList, this.baseCurrency);
}
