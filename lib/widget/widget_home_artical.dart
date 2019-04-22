import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/utils/date_format_uitl.dart';

@immutable
class HomeArticalWidget extends StatelessWidget {
  final Artical artical;

  HomeArticalWidget({Key key, @required this.artical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: _topRow(context),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              artical.title,
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: _bottomRow(),
          ),
          Divider()
        ],
      ),
    );
  }

  List<Widget> _topRow(BuildContext context) {
    List<Widget> widgets = List();
    if (artical.tags != null) {
      artical.tags.forEach((tag) {
        var tagWidget = Container(
          child: Text(
            tag.name,
            style: TextStyle(color: Colors.green),
          ),
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        );
        widgets.add(tagWidget);
      });
    }
    var authorWidget = Text(artical.author);
    widgets.add(authorWidget);

    var timeWidget = Text('${artical.publishTime}');
    widgets.add(timeWidget);
    return widgets;
  }

  List<Widget> _bottomRow() {
    List<Widget> widgets = List();
    var categoryWidget = Text(
      '${artical.chapterName}',
      textAlign: TextAlign.left,
    );
    var collection = IconButton(
      icon: Icon(Icons.hearing),
      onPressed: () {},
    );
    widgets..add(categoryWidget)..add(collection);
    return widgets;
  }
}
