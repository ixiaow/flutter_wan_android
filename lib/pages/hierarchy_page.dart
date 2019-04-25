import 'package:flutter/material.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_refresh.dart';
import 'package:flutter_wan_android/model/hierarchy.dart';
import 'package:flutter_wan_android/widget/widget_hierarchy.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/widget/widget_future_build.dart';

class HierarchyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: FutureBuilderWidget(
          contentWidget: (data) => HierarchyListWidget(data: data),
          future: getHierarchyData(),
        ));
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

@immutable
class HierarchyListWidget extends StatefulWidget {
  final List<Category> data;

  HierarchyListWidget({Key key, this.data}) : super(key: key);

  _HierarchyListWidgetState createState() => _HierarchyListWidgetState();
}

class _HierarchyListWidgetState extends State<HierarchyListWidget> {
  GlobalKey<RefreshHeaderState> _headerStateKey = GlobalKey();
  List<Category> _data = List();

  @override
  void initState() {
    _data.addAll(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshWidget(
        easyRefreshHeaderKey: _headerStateKey,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, index) => Container(
                child: Divider(height: 1.0),
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              ),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return HierarchyItemWidget(
              category: _data[index],
            );
          },
        ),
        onRefresh: () async {
          await getHierarchyData().then((hierarchy) {
            setState(() {
              _data.clear();
              _data.addAll(hierarchy);
            });
          });
        },
      ),
    );
  }
}
