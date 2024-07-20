import 'package:equatable/equatable.dart';

class CurrencyRate extends Equatable {
  final String currencyCode;
  final double rate;

  const CurrencyRate({required this.currencyCode, required this.rate});

  @override
  List<Object?> get props => [currencyCode, rate];
}
