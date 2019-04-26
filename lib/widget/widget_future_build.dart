import 'package:flutter/material.dart';

typedef Widget Callback<T>(T data);

@immutable
class FutureBuilderWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Callback<T> contentWidget;
  final Widget waitingWiget;
  final Widget emptyWidget;
  final Callback<String> errorWidget;

  static Widget defaultWaitingWidget =
      const Center(child: RefreshProgressIndicator());
  static Widget defaultEmptyWidget = const Center(child: Text('暂无数据'));

  const FutureBuilderWidget(
      {Key key,
      @required this.future,
      @required this.contentWidget,
      this.waitingWiget,
      this.errorWidget,
      this.emptyWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapShot) {
    switch (snapShot.connectionState) {
      case ConnectionState.waiting:
        return waitingWiget ?? defaultWaitingWidget;
      case ConnectionState.done:
        if (snapShot.hasError) {
          return _errorWidget(snapShot);
        }
        if (snapShot.hasData) {
          return contentWidget(snapShot.data);
        }
        return emptyWidget ?? defaultEmptyWidget;
      default:
        return emptyWidget ?? defaultEmptyWidget;
    }
  }

  Widget _errorWidget(AsyncSnapshot snapShot) {
    if (errorWidget == null) {
      return Center(
        child: Text('数据加载失败,${snapShot.error}'),
      );
    }
    return errorWidget(snapShot.error.toString());
  }
}
