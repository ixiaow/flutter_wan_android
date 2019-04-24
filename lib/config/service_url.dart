class ServicePath {
  ServicePath._();
  static const serviceUrl = "https://www.wanandroid.com";

  static const banner = serviceUrl + '/banner/json';

  static const homeArtical = serviceUrl + '/article/list/{page}/json';

  static const topArtical = serviceUrl + '/article/top/json';
}
