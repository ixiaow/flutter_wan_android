import 'package:json_annotation/json_annotation.dart';

part 'swiper_item.g.dart';

@JsonSerializable(nullable: false)
class SwiperBean {
  int errorCode;
  String errorMsg;
  @JsonKey(name: 'data')
  List<SwiperBeanItem> swiperBeanItems;

  SwiperBean({this.errorCode, this.errorMsg, this.swiperBeanItems});

  factory SwiperBean.fromJson(Map<String, dynamic> json) => _$SwiperBeanFromJson(json);
  Map<String, dynamic> toJson() => _$SwiperBeanToJson(this);
}

@JsonSerializable(nullable: false)
class SwiperBeanItem {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  SwiperBeanItem(
      {this.desc,
      this.id,
      this.imagePath,
      this.isVisible,
      this.order,
      this.title,
      this.type,
      this.url});

  factory SwiperBeanItem.fromJson(Map<String, dynamic> json) =>
      _$SwiperBeanItemFromJson(json);
  Map<String, dynamic> toJson() => _$SwiperBeanItemToJson(this);
}
