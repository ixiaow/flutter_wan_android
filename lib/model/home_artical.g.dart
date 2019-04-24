// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_artical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArtical _$HomeArticalFromJson(Map<String, dynamic> json) {
  return HomeArtical(
      data: PageContent.fromJson(json['data'] as Map<String, dynamic>),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String);
}

Map<String, dynamic> _$HomeArticalToJson(HomeArtical instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

PageContent _$PageContentFromJson(Map<String, dynamic> json) {
  return PageContent(
      curPage: json['curPage'] as int,
      datas: (json['datas'] as List)
          .map((e) => Artical.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: json['offset'] as int,
      over: json['over'] as bool,
      pageCount: json['pageCount'] as int,
      size: json['size'] as int,
      total: json['total'] as int);
}

Map<String, dynamic> _$PageContentToJson(PageContent instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas.map((e) => e.toJson()).toList(),
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };

Artical _$ArticalFromJson(Map<String, dynamic> json) {
  return Artical(
      apkLink: json['apkLink'] as String,
      author: json['author'] as String,
      chapterId: json['chapterId'] as int,
      chapterName: json['chapterName'] as String,
      collect: json['collect'] as bool,
      courseId: json['courseId'] as int,
      desc: json['desc'] as String,
      envelopePic: json['envelopePic'] as String,
      fresh: json['fresh'] as bool,
      id: json['id'] as int,
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      origin: json['origin'] as String,
      prefix: json['prefix'] as String,
      projectLink: json['projectLink'] as String,
      publishTime: json['publishTime'] as int,
      superChapterId: json['superChapterId'] as int,
      superChapterName: json['superChapterName'] as String,
      tags: (json['tags'] as List)
          .map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      type: json['type'] as int,
      userId: json['userId'] as int,
      visible: json['visible'] as int,
      zan: json['zan'] as int);
}

Map<String, dynamic> _$ArticalToJson(Artical instance) => <String, dynamic>{
      'apkLink': instance.apkLink,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(name: json['name'] as String, url: json['url'] as String);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
