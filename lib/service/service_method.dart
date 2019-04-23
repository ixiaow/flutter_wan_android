import 'package:dio/dio.dart';
import 'package:flutter_wan_android/config/service_url.dart';
import 'package:flutter_wan_android/model/swiper_item.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/utils/http_utils.dart';

Dio dio() => Dio();

Future<SwiperBean> getHomeBanner() async {
  try {
    Response response = await dio().get(ServicePath.banner);
    return SwiperBean.fromJson(response.data);
  } on DioError catch (e) {
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<HomeArtical> getHomeArtical({int page = 0}) async {
  try {
    Response response =
        await Http.request(ServicePath.homeArtical, urlParams: {'page': page});
    return HomeArtical.fromJson(response.data);
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<Map<String, dynamic>> getHomeData() async {
  try {
    List response = await Future.wait([getHomeBanner(), getHomeArtical()]);
    Map<String, dynamic> result = Map();
    result['banner'] = response[0];
    result['homeArtical'] = response[1];
    return result;
  } on DioError catch (e) {
    throw Exception(e.response?.data ?? e.message);
  }
}
