import 'package:flutter/material.dart';
import 'package:flutter_wan_android/widget/widget_refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/model/wx_articl_tab.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_project_item.dart';
import 'package:flutter_wan_android/widget/widget_future_build.dart';

class ProjectDetailPage extends StatelessWidget {
  final WxArticaltTabItem tabItem;
  ProjectDetailPage({Key key, @required this.tabItem});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
        future: getProjectTabContnet(tabItem.id),
        contentWidget: (data) =>
            ProjectDetailListWidget(id: tabItem.id, pageContent: data));
  }
}

class ProjectDetailListWidget extends StatefulWidget {
  final PageContent pageContent;
  final int id = 0;

  ProjectDetailListWidget(
      {Key key, @required int id, @required this.pageContent})
      : super(key: key);

  _ProjectDetailListWidgetState createState() =>
      _ProjectDetailListWidgetState();
}

class _ProjectDetailListWidgetState extends State<ProjectDetailListWidget>
    with AutomaticKeepAliveClientMixin {
  List<Artical> _data = [];
  GlobalKey<RefreshHeaderState> _headerStateKey = GlobalKey();
  GlobalKey<RefreshFooterState> _footerStateKey = GlobalKey();
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey();
  bool _isLoadMore = true;
  int _page = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _data.addAll(widget.pageContent.datas);
    _isLoadMore = !widget.pageContent.over;
    _page = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshWidget(
      easyRefreshKey: _easyRefreshKey,
      easyLoadMoreHeaderKey: _footerStateKey,
      easyRefreshHeaderKey: _headerStateKey,
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
              child: Divider(
                height: 1.0,
              ),
            ),
        itemCount: _data?.length ?? 0,
        itemBuilder: (context, index) {
          return ProjectItemWidget(
            artical: _data[index],
          );
        },
      ),
      onRefresh: () async {
        await getProjectTabContnet(widget.id).then((pageContent) {
          setState(() {
            _data.clear();
            _data.addAll(pageContent.datas);
            _isLoadMore = !pageContent.over;
            _page = 1;
          });
        });
      },
      onLoadMore: _isLoadMore
          ? () async {
              await getProjectTabContnet(widget.id, page: _page)
                  .then((pageContent) {
                setState(() {
                  _data.addAll(pageContent.datas);
                  _isLoadMore = !pageContent.over;
                  if (_isLoadMore) {
                    _page++;
                  }
                });
              });
            }
          : null,
    );
  }
}
