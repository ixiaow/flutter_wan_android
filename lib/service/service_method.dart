import 'package:dio/dio.dart';
import 'package:flutter_wan_android/config/service_url.dart';
import 'package:flutter_wan_android/model/swiper_item.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/utils/http_utils.dart';
import 'package:flutter_wan_android/model/home_top_artical.dart';
import 'package:flutter_wan_android/model/hierarchy.dart';
import 'package:flutter_wan_android/model/wx_articl_tab.dart';
import 'package:flutter_wan_android/model/navigation.dart';

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
    List response =
        await Future.wait([getHomeBanner(), getTopArtical(), getHomeArtical()]);
    return <String, dynamic>{
      'banner': response[0],
      'topArtical': response[1],
      'homeArtical': response[2]
    };
  } on DioError catch (e) {
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<Artical>> getTopArtical() async {
  try {
    Response response = await Http.request(ServicePath.topArtical);
    return TopArtical.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<Category>> getHierarchyData() async {
  try {
    print('获取体系...');
    Response response = await Http.request(ServicePath.hierarchyUrl);
    return Hierarchy.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<PageContent> getHierarchyDetailArtical(int cid, {int page = 0}) async {
  try {
    Response response = await Http.request(ServicePath.hierarchyDetailArtical,
        queryParams: {'cid': cid}, urlParams: {'page': page});
    return HomeArtical.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<WxArticaltTabItem>> getWxArticalTabs() async {
  try {
    Response response = await Http.request(ServicePath.wxArticalTab);
    return WxArticalTab.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<PageContent> getWxArticalList(int id, {int page = 0}) async {
  try {
    Response response = await Http.request(ServicePath.wxArticalTabList,
        urlParams: {'id': id, 'page': page});
    return HomeArtical.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<WxArticaltTabItem>> getProjectTabs() async {
  try {
    Response response = await Http.request(ServicePath.projectTabs);
    return WxArticalTab.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<PageContent> getProjectTabContnet(int cid, {int page = 0}) async {
  try {
    Response response = await Http.request(ServicePath.projectTabContent,
        queryParams: {'cid': cid}, urlParams: {'page': page});
    return HomeArtical.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}

Future<List<NavigationContent>> getNavigation() async {
  try {
    Response response = await Http.request(ServicePath.navigation);
    return Navigation.fromJson(response.data).data;
  } on DioError catch (e) {
    print('错误： ${e.request.uri}');
    throw Exception(e.response?.data ?? e.message);
  }
}
