import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/utils/date_format_uitl.dart';
import 'package:html_unescape/html_unescape.dart';

@immutable
class HomeArticalWidget extends StatelessWidget {
  final Artical artical;

  HomeArticalWidget({Key key, @required this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        children: <Widget>[_topRow(), _titleWidget(), _bottomRow(), Divider()],
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
      ),
    );
  }

  Row _topRow() {
    List<Widget> widgets = List();
    List<Widget> tagWidgets = _tagWidgets();
    Widget authorWidget = _authorWidget();
    Widget publishTimeWidget = _publishTimeWidget();
    widgets
      ..addAll(tagWidgets)
      ..add(authorWidget)
      ..add(publishTimeWidget);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
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

  List<Widget> _tagWidgets() {
    List<Widget> widgets = List();
    if (artical.tags == null) {
      return widgets;
    }
    artical.tags.forEach((tag) {
      var tagWidget = Container(
        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
        margin: EdgeInsets.only(right: 5.0),
        child: Text(
          tag.name,
          style: TextStyle(color: Colors.green, fontSize: 12.0),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(2.5))),
      );
      widgets.add(tagWidget);
    });
    return widgets;
  }

  Row _bottomRow() {
    List<Widget> widgets = List();
    var categoryWidget = Expanded(
      child: Text(
        '${artical.superChapterName} / ${artical.chapterName}',
        textAlign: TextAlign.left,
      ),
    );

    var collection = IconButton(
      icon: Icon(Icons.collections_bookmark),
      onPressed: () {},
    );
    widgets..add(categoryWidget)..add(collection);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }
}
