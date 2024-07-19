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

  const HomeSuccess({required this.currencyList});
}

class HomeError extends HomeState {
  final String error;

  const HomeError({required this.error});
}

class CurrencyConverting extends HomeState {}
