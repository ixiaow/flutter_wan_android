import 'package:flutter/material.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_refresh.dart';
import 'package:flutter_wan_android/model/hierarchy.dart';

class HierarchyPage extends StatefulWidget {
  HierarchyPage({Key key}) : super(key: key);
  _HierarchyPageState createState() => _HierarchyPageState();
}

class _HierarchyPageState extends State<HierarchyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: FutureBuilder(
        builder: _futureBuild,
        future: getHierarchyData(),
      ),
    );
  }

  Widget _futureBuild(BuildContext context, AsyncSnapshot snapShot) {
    switch (snapShot.connectionState) {
      case ConnectionState.waiting:
        return Center(child: RefreshProgressIndicator());
      case ConnectionState.done:
        if (snapShot.hasError) {
          return Center(child: Text('加载出错啦：${snapShot.error}'));
        }
        if (snapShot.hasData) {
          return HierarchyListWidget(data: snapShot.data);
        }
        return Center(
          child: Text('数据为空'),
        );
      default:
        return Container();
    }
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0.4,
      title: Text('知识体系'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }
}

class HierarchyListWidget extends StatefulWidget {
  List<Category> data;

  HierarchyListWidget({Key key, this.data}) : super(key: key);

  _HierarchyListWidgetState createState() => _HierarchyListWidgetState();
}

class _HierarchyListWidgetState extends State<HierarchyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshWidget(
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[ListTile(), Divider()],
            );
          },
        ),
      ),
    );
  }
}
