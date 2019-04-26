import 'package:flutter/material.dart';
import 'package:flutter_wan_android/widget/widget_refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/model/wx_articl_tab.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_home_artical.dart';

class WxArticalDetailPage extends StatefulWidget {
  final WxArticaltTabItem detailTag;

  WxArticalDetailPage({Key key, @required this.detailTag});

  @override
  _HierarchyDetailContnetPageState createState() =>
      _HierarchyDetailContnetPageState();
}

class _HierarchyDetailContnetPageState extends State<WxArticalDetailPage>
    with AutomaticKeepAliveClientMixin {
  List<Artical> _data;
  GlobalKey<RefreshHeaderState> _headerStateKey = GlobalKey();
  GlobalKey<RefreshFooterState> _footerStateKey = GlobalKey();
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey();
  bool _isLoadMore = true;
  int _page = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getWxArticalList(widget.detailTag.id).then((pageContent) {
      setState(() {
        _data = List();
        _data.addAll(pageContent.datas);
        _isLoadMore = !pageContent.over;
        _page = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_data == null) {
      return Center(
        child: RefreshProgressIndicator(),
      );
    }

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
          return HomeArticalWidget(
            artical: _data[index],
          );
        },
      ),
      onRefresh: () async {
        await getWxArticalList(widget.detailTag.id)
            .then((pageContent) {
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
              await getWxArticalList(widget.detailTag.id, page: _page)
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
