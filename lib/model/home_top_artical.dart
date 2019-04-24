import 'home_artical.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class TopArtical {
  List<Artical> data;

  TopArtical({this.data});

  factory TopArtical.fromJson(Map<String, dynamic> json) => TopArtical(
      data: (json['data'] as List).map((e) => Artical.fromJson(e)).toList());

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': this.data.map((e) => e.toJson()).toList()};
}
