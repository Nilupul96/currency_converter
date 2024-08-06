import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net.dart';
import '../../../../core/network/net_result.dart';
import '../../../../core/network/net_url.dart';
import '../models/currency_model.dart';
import '../models/currency_rate_model.dart';

abstract class HomeService {
  Future<Result> fetchCurrencyList();
  Future<Result> fetchCurrencyRates(
      {required String baseCurrency,
      required List<String> convertCurrencyCodes});
}

class HomeServiceImpl implements HomeService {
  @override
  Future<Result> fetchCurrencyList() async {
    Result result = Result();
    try {
      var net = Net(
          url: URL.GET_CURRENCY_LIST,
          method: NetMethod.GET,
          queryParam: {'apikey': dotenv.env['API_KEY']!});

      result = await net.perform();

      if (result.exception == null && result.result != "") {
        final data =
            currencyFromJson(jsonEncode(jsonDecode(result.result)['data']));
        result.result = data.values.toList();
      }
      return result;
    } catch (err) {
      Log.err("$err");
      result.exception = NetException(
          message: "$err",
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }

  @override
  Future<Result> fetchCurrencyRates(
      {required String baseCurrency,
      required List<String> convertCurrencyCodes}) async {
    Result result = Result();
    try {
      var net = Net(
        url: URL.CONVERT_CURRENCY,
        method: NetMethod.GET,
        queryParam: {
          'apikey': dotenv.env['API_KEY']!,
          'base_currency': baseCurrency,
          'currencies': convertCurrencyCodes.join(',')
        },
      );

      result = await net.perform();

      if (result.exception == null && result.result != "") {
        Map<String, dynamic> decodedJson = json.decode(result.result)['data'];
        List<CurrencyRateModel> currencyRates = [];
        decodedJson.forEach((currency, rate) {
          currencyRates.add(CurrencyRateModel(
              currencyCode: currency, rate: double.parse(rate.toString())));
        });
        result.result = currencyRates;
        Log.info('Currency rates-- ${result.result}');
      }
      return result;
    } catch (err) {
      Log.err("$err");
      result.exception = NetException(
          message: "$err",
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }
}
