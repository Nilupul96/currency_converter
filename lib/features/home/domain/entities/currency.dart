import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String symbol;
  final String name;
  final String symbolNative;
  final String code;
  final String namePlural;

  const Currency({
    required this.symbol,
    required this.name,
    required this.symbolNative,
    required this.code,
    required this.namePlural,
  });

  @override
  List<Object?> get props => [symbol, name, symbol, symbolNative, namePlural];
}
