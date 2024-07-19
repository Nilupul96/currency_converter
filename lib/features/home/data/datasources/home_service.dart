import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net.dart';
import '../../../../core/network/net_result.dart';
import '../../../../core/network/net_url.dart';

class HomeService {
  static final HomeService _singleton = HomeService._internal();

  factory HomeService() {
    return _singleton;
  }

  HomeService._internal();

  Future<Result> fetchCurrencyList() async {
    Result result = Result();
    try {
      var net = Net(
        url: URL.GET_CURRENCY_LIST,
        method: NetMethod.GET,
      );

      result = await net.perform();
      Log.debug("result is **** ${result.result}");

      if (result.exception == null && result.result != "") {}
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
