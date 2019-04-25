import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

@immutable
class RefreshWidget extends StatelessWidget {
  final GlobalKey<RefreshHeaderState> easyRefreshHeaderKey;
  final GlobalKey<RefreshFooterState> easyLoadMoreHeaderKey;
  final GlobalKey<EasyRefreshState> easyRefreshKey;
  final Widget child;
  final OnRefresh onRefresh;
  final LoadMore onLoadMore;

  RefreshWidget(
      {Key key,
      @required this.child,
      this.easyRefreshHeaderKey,
      this.easyLoadMoreHeaderKey,
      this.easyRefreshKey,
      this.onRefresh,
      this.onLoadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      key: easyRefreshKey,
      refreshHeader: easyRefreshHeaderKey != null
          ? ClassicsHeader(
              key: easyRefreshHeaderKey,
              refreshText: '下拉刷新',
              refreshReadyText: '释放刷新',
              refreshingText: '刷新中...',
              refreshedText: '刷新完成',
              moreInfo: '更新于 %T',
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            )
          : null,
      refreshFooter: easyLoadMoreHeaderKey != null
          ? ClassicsFooter(
              key: easyLoadMoreHeaderKey,
              loadText: '上啦加载',
              loadReadyText: '释放加载',
              loadingText: '加载中...',
              loadedText: '加载完成',
              noMoreText: '没有更多啦',
              moreInfo: '更新于 %T',
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            )
          : null,
      onRefresh: onRefresh,
      loadMore: onLoadMore,
      child: child,
    );
  }
}