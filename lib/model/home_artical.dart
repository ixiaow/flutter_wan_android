import 'package:json_annotation/json_annotation.dart';

part 'home_artical.g.dart';

@JsonSerializable(nullable: false)
class HomeArtical {
  PageContent data;
  int errorCode;
  String errorMsg;

  HomeArtical({this.data, this.errorCode, this.errorMsg});

  factory HomeArtical.fromJson(Map<String, dynamic> json) =>
      _$HomeArticalFromJson(json);

  Map<String, dynamic> toJson() => _$HomeArticalToJson(this);
}

@JsonSerializable(nullable: false)
class PageContent {
  int curPage;
  List<Artical> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  PageContent(
      {this.curPage,
      this.datas,
      this.offset,
      this.over,
      this.pageCount,
      this.size,
      this.total});

  factory PageContent.fromJson(Map<String, dynamic> json) =>
      _$PageContentFromJson(json);

  Map<String, dynamic> toJson() => _$PageContentToJson(this);
}

@JsonSerializable(nullable: false)
class Artical {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<Tags> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  Artical(
      {this.apkLink,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.envelopePic,
      this.fresh,
      this.id,
      this.link,
      this.niceDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan});

  factory Artical.fromJson(Map<String, dynamic> json) =>
      _$ArticalFromJson(json);

  Map<String, dynamic> toJson() => _$ArticalToJson(this);
}

@JsonSerializable(nullable: false)
class Tags {
  String name;
  String url;

  Tags({this.name, this.url});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
