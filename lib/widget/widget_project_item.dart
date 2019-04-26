import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/utils/date_format_uitl.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_wan_android/pages/web_view_page.dart';

@immutable
class ProjectItemWidget extends StatelessWidget {
  final Artical artical;

  ProjectItemWidget({Key key, @required this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        margin: EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _leftRow(),
            _rightRow(),
          ],
        ),
      ),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsWebPage(
            url: artical.link,
            title: artical.title,
          );
        }));
      },
    );
  }

  Widget _leftRow() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Image.network(
        artical.envelopePic,
        fit: BoxFit.fill,
      ),
      height: 180.0,
      width: 120.0,
    );
  }

  Widget _rightRow() {
    return Expanded(
      child: Container(
        height: 180.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_titleWidget(), _descWidget(), _bottomRow()],
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        HtmlUnescape().convert(artical.desc),
        textAlign: TextAlign.left,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      alignment: Alignment.centerLeft,
      child: Text(
        HtmlUnescape().convert(artical.title),
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _authorWidget() {
    return Text(artical.author.trimLeft());
  }

  Widget _publishTimeWidget() {
    String publishTime = DateUtil.formatDurationTime(artical.publishTime);
    return Expanded(
      child: Align(
        child: Text(publishTime),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget _bottomRow() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _authorWidget(),
          _publishTimeWidget(),
        ],
      ),
    );
  }
}
