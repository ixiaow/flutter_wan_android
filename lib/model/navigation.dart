import 'home_artical.dart';

class Navigation {
  List<NavigationContent> data;
  int errorCode;
  String errorMsg;

  Navigation({this.data, this.errorCode, this.errorMsg});

  factory Navigation.fromJson(Map<String, dynamic> json) {
    return Navigation(
        errorCode: json['errorCode'],
        errorMsg: json['errorMsg'],
        data: (json['data'] as List)
            .map((e) => NavigationContent.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'errorCode': this.errorCode,
        'errorMsg': this.errorMsg,
        'data': this.data.map((f) => f.toJson()).toList()
      };
}

class NavigationContent {
  List<Artical> articles;
  int cid;
  String name;

  NavigationContent({this.articles, this.cid, this.name});

  factory NavigationContent.fromJson(Map<String, dynamic> json) {
    return NavigationContent(
        cid: json['cid'],
        name: json['name'],
        articles: (json['articles'] as List)
            .map((f) => Artical.fromJson(f))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    data['cid'] = this.cid;
    data['name'] = this.name;
    return data;
  }
}
