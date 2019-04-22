// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swiper_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwiperBean _$SwiperBeanFromJson(Map<String, dynamic> json) {
  return SwiperBean(
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
      swiperBeanItems: (json['data'] as List)
          .map((e) => SwiperBeanItem.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$SwiperBeanToJson(SwiperBean instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.swiperBeanItems
    };

SwiperBeanItem _$SwiperBeanItemFromJson(Map<String, dynamic> json) {
  return SwiperBeanItem(
      desc: json['desc'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
      isVisible: json['isVisible'] as int,
      order: json['order'] as int,
      title: json['title'] as String,
      type: json['type'] as int,
      url: json['url'] as String);
}

Map<String, dynamic> _$SwiperBeanItemToJson(SwiperBeanItem instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
