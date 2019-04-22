import 'package:dio/dio.dart';
import 'package:flutter_wan_android/config/service_url.dart';
import 'package:flutter_wan_android/model/swiper_item.dart';
import 'package:flutter_wan_android/model/home_artical.dart';

Dio dio() => Dio();

Future<SwiperBean> getHomeBanner() async {
  try {
    Response response = await dio().get(ServicePath.banner);
    return SwiperBean.fromJson(response.data);
  } on DioError catch (e) {
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<HomeArtical> getHomeArtical() async {
  try {
    Response response = await dio().get(ServicePath.homeArtical);
    return HomeArtical.fromJson(response.data);
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<dynamic>> getHomeData() async {
  try {
    List response = await Future.wait([getHomeBanner(), getHomeArtical()]);
    return response;
  } on DioError catch (e) {
    throw Exception(e.response?.data ?? e.message);
  }
}
