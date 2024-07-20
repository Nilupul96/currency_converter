import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'dart:convert';

Map<String, CurrencyModel> currencyFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, CurrencyModel>(k, CurrencyModel.fromJson(v)));

String currencyToJson(Map<String, CurrencyModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class CurrencyModel extends Currency {
  const CurrencyModel(
      {required super.symbol,
      required super.name,
      required super.symbolNative,
      required super.code,
      required super.namePlural});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        symbol: json["symbol"],
        name: json["name"],
        symbolNative: json["symbol_native"],
        code: json["code"],
        namePlural: json["name_plural"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "symbol_native": symbolNative,
        "code": code,
        "name_plural": namePlural,
      };
}
