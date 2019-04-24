import 'package:json_annotation/json_annotation.dart';

part 'hierarchy.g.dart';

@JsonSerializable(nullable: false)
class Hierarchy {
  List<Category> data;
  int errorCode;
  String errorMsg;

  Hierarchy({this.data, this.errorCode, this.errorMsg});

  factory Hierarchy.fromJson(Map<String, dynamic> json) =>
      _$HierarchyFromJson(json);

  Map<String, dynamic> toJson() => _$HierarchyToJson(this);
}

@JsonSerializable(nullable: false)
class Category {
  List<DetailTag> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  Category(
      {this.children,
      this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(nullable: false)
class DetailTag {
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  DetailTag(
      {this.courseId,
      this.id,
      this.name,
      this.order,
      this.parentChapterId,
      this.userControlSetTop,
      this.visible});

  factory DetailTag.fromJson(Map<String, dynamic> json) =>
      _$DetailTagFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTagToJson(this);
}
