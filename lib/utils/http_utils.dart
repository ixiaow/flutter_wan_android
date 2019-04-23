import 'package:dio/dio.dart';

enum MethodType { GET, POST }

class Http {
  Http._();

  static Dio _dio = Dio();

  static Future<Response<T>> request<T>(String path,
      {MethodType method = MethodType.GET,
      Map<String, dynamic> queryParams,
      Map<String, dynamic> urlParams}) {
    if (urlParams != null) {
      path = _parserParamaters(path, urlParams);
    }

    if (method == MethodType.GET) {
      return _dio.get(path, queryParameters: queryParams);
    }

    if (method == MethodType.POST) {
      return _dio.post(path, queryParameters: queryParams);
    }
    return null;
  }

  static String _parserParamaters(
    String path,
    Map<String, dynamic> urlParams,
  ) {
    urlParams.forEach((key, value) {
      if (path.indexOf(key) != -1) {
        path = path.replaceAll('{$key}', value.toString());
      }
    });
    return path;
  }
}
