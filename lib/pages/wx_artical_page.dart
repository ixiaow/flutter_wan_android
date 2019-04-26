import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/wx_articl_tab.dart';
import 'package:flutter_wan_android/widget/widget_future_build.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'wx_artical_detail_page.dart';

@immutable
class WxArticalPage extends StatelessWidget {
  final List<WxArticaltTabItem> _tabs = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
      future: getWxArticalTabs(),
      contentWidget: (data) {
        _tabs.clear();
        _tabs.addAll(data);
        return DefaultTabController(
            length: data.length,
            child: Scaffold(
                appBar: _appBar(),
                body: TabBarView(
                  children: _tabBarContentView(),
                )));
      },
      errorWidget: (error) {
        return Scaffold(
          appBar: _appBar(),
          body: Center(
            child: Text('出现错误啦: $error'),
          ),
        );
      },
      waitingWiget: Scaffold(
        appBar: _appBar(),
        body: FutureBuilderWidget.defaultWaitingWidget,
      ),
    );
  }

  List<Widget> _tabBarContentView() =>
      _tabs.map((e) => WxArticalDetailPage(detailTag: e)).toList();

  Widget _appBar() {
    return AppBar(
      title: Text('公众号'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
      bottom: _tabs.isNotEmpty
          ? TabBar(
              tabs: _tabWidgets(),
              isScrollable: true,
            )
          : null,
    );
  }

  List<Widget> _tabWidgets() {
    print('获取tabs widget');
    return _tabs
        .map((e) => Container(
              child: Text(e.name),
              padding: EdgeInsets.all(10.0),
            ))
        .toList();
  }
}
