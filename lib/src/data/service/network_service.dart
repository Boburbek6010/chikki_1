import 'dart:convert';
import 'package:http_interceptor/http/intercepted_http.dart';

import 'interseptor_services.dart';




class NetworkService {
  // baseUrl
  static const isTester = true;


  static const DEVELOPMENT_SERVER = 'search-maps.yandex.ru';
  static const DEPLOYMENT_SERVER =  'search-maps.yandex.ru';//'admin-nefro.ssv.uz';


  static String get BASEURL {
    if (isTester) {
      return DEVELOPMENT_SERVER;
    } else {
      return DEPLOYMENT_SERVER;
    }
  }

  // APIS
  static String apiGetAllRoutes = '/v1/';


  // headers
  static Map<String, String>? headers = {
    'Cookie': '_yasc=U/IBpOuI0IrPyFdnPv1YFnGMCsvjSxew+W43iD53JUn+c5whcN/ZWtaxCKwR; i=x6yXQHN7lV5tZi8SogewpVJ71P7gaTY6lohx9AoqTVPBd3soTuiFqDIdAn0Cs7vWZYhd6hQ7wAkQdXo0w6LAJhok96I='
  };


  // interceptor
  static final http = InterceptedHttp.build(interceptors: [
    InterceptorService(),
  ]);


  //methods
  static Future<String> GET(String api,  Map<String, String> params) async {
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return '\nError occurred on Status Code ${response.statusCode}\n';
  }

  // POST
   //,
  static Future<String?> POST(String api,  Map<String, dynamic> body) async {
    Uri url = Uri.https(BASEURL, api);
    final response = await http.post(url,  body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }else{
      return response.reasonPhrase;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params,
      Map<String, dynamic> body) async {
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.put(
        url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> params,
      Map<String, dynamic> body) async {
    Uri url = Uri.https(BASEURL, api);
    final response = await http.patch(
        url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }


  /// params

  static Map<String, String> paramsYandex(String text, String lang) {
    Map<String, String> map = {
      'apikey':'b59d43fa-2d75-4f5e-9478-0ff16c97e122',
      'text':text,
      'lang':lang,
      'bbox':'37.184341,55.996672~45.605241,73.150164',
    };
    return map;
  }

  static Map<String, String> paramsCurrentLocation(String text) {
    Map<String, String> map = {
      'apikey':'b59d43fa-2d75-4f5e-9478-0ff16c97e122',
      'text':text,
      'lang':'uz',
      'bbox':'37.184341,55.996672~45.605241,73.150164',
      'type':'geo',
      'results':'1'
    };
    return map;
  }


}