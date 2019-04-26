class ServicePath {
  ServicePath._();
  static const serviceUrl = "https://www.wanandroid.com";

  static const banner = serviceUrl + '/banner/json';

  static const homeArtical = serviceUrl + '/article/list/{page}/json';

  static const topArtical = serviceUrl + '/article/top/json';

  static const hierarchyUrl = serviceUrl + '/tree/json';

  static const hierarchyDetailArtical =
      serviceUrl + '/article/list/{page}/json';

  static const wxArticalTab = serviceUrl + '/wxarticle/chapters/json';

  static const wxArticalTabList =
      serviceUrl + '/wxarticle/list/{id}/{page}/json';

  static const projectTabs = serviceUrl + '/project/tree/json';

  static const projectTabContent = serviceUrl + '/project/list/{page}/json';

  static const navigation = serviceUrl + '/navi/json';
}
