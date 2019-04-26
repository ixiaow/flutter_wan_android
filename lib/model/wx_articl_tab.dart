class WxArticalTab {
  List<WxArticaltTabItem> data;
  int errorCode;
  String errorMsg;

  WxArticalTab({this.data, this.errorCode, this.errorMsg});

  factory WxArticalTab.fromJson(Map<String, dynamic> json) {
    return WxArticalTab(
        errorCode: json['errorCode'],
        errorMsg: json['errorMsg'],
        data: (json['data'] as List).map((e) => WxArticaltTabItem.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'errorCode': this.errorCode,
        'errorMsg': this.errorMsg,
        'data': this.data.map((e) => e.toJson()).toList()
      };
}

class WxArticaltTabItem {
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  WxArticaltTabItem(
      {this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible});

  factory WxArticaltTabItem.fromJson(Map<String, dynamic> json) {
    return WxArticaltTabItem(
        courseId: json['courseId'],
        id: json['id'],
        name: json['name'],
        order: json['order'],
        parentChapterId: json['parentChapterId'],
        userControlSetTop: json['userControlSetTop'],
        visible: json['visible']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'courseId': this.courseId,
        'id': this.id,
        'name': this.name,
        'order': this.order,
        'parentChapterId': this.parentChapterId,
        'userControlSetTop': this.userControlSetTop,
        'visible': this.visible
      };
}
