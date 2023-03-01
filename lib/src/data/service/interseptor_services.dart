import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:l/l.dart';

class InterceptorService implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    // l.i(data.url.toString());
    // l.i(data.method.toString());
    // l.i(data.headers.toString());
    // l.i(data.params.toString());
    // l.i(data.body.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    l.v('Status Code: ${data.statusCode.toString()}');
    // l.w(data.body.toString());
    return data;
  }
}