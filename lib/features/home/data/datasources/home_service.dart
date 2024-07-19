import 'dart:convert';

import '../../../../core/app_const.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net.dart';
import '../../../../core/network/net_result.dart';
import '../../../../core/network/net_url.dart';
import '../models/currency_model.dart';

abstract class HomeService {
  Future<Result> fetchCurrencyList();
}

class HomeServiceImpl implements HomeService {
  @override
  Future<Result> fetchCurrencyList() async {
    Result result = Result();
    try {
      var net = Net(
          url: URL.GET_CURRENCY_LIST,
          method: NetMethod.GET,
          queryParam: {'apikey': AppConst.API_KEY});

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
}
