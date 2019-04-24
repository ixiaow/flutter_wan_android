// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hierarchy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hierarchy _$HierarchyFromJson(Map<String, dynamic> json) {
  return Hierarchy(
      data: (json['data'] as List)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String);
}

Map<String, dynamic> _$HierarchyToJson(Hierarchy instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      children: (json['children'] as List)
          .map((e) => DetailTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseId: json['courseId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      parentChapterId: json['parentChapterId'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };

DetailTag _$DetailTagFromJson(Map<String, dynamic> json) {
  return DetailTag(
      courseId: json['courseId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      parentChapterId: json['parentChapterId'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$DetailTagToJson(DetailTag instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
