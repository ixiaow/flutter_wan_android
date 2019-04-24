import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class NewsWebPage extends StatefulWidget {
  final String url;
  final String title;

  NewsWebPage({Key key, @required this.url, this.title});

  @override
  State<StatefulWidget> createState() => new NewsWebPageState();
}

class NewsWebPageState extends State<NewsWebPage> {
  // 标记是否是加载中
  bool _loading = true;
  // 标记当前页面是否是我们自定义的回调页面
  bool _isLoadingCallbackPage = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  // WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  // 插件提供的对象，该对象用于WebView的各种操作
  FlutterWebviewPlugin _flutterWebViewPlugin = new FlutterWebviewPlugin();

  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _onStateChanged = _flutterWebViewPlugin.onStateChanged
        .listen((WebViewStateChanged state) {
      // state.type是一个枚举类型，取值有：WebViewState.shouldStart, WebViewState.startLoad, WebViewState.finishLoad
      switch (state.type) {
        case WebViewState.shouldStart:
          // 准备加载
          setState(() {
            _loading = true;
          });
          break;
        case WebViewState.startLoad:
          // 开始加载
          break;
        case WebViewState.finishLoad:
          // 加载完成
          setState(() {
            _loading = false;
          });
          if (_isLoadingCallbackPage) {
            // 当前是回调页面，则调用js方法获取数据
            parseResult();
          }
          break;
        default:
          break;
      }
    });
    _flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (!mounted) {
        return;
      }

      if (url.startsWith('http://') || url.startsWith('https://')) {
        if (!_history.contains(url)) {
          _history.add(url);
        }
        return;
      }
      print('使用urlLaunch加载');
      _flutterWebViewPlugin.goForward();
      _launchSchemes(url);
    });
  }

  void _launchSchemes(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      print('Could not launch $url');
    }
  }

  // 解析WebView中的数据
  void parseResult() {
//    flutterWebViewPlugin.evalJavascript("get();").then((result) {
//      // result json字符串，包含token信息
//
//    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(Expanded(
      flex: 1,
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.start,
      ),
    ));
    if (_loading) {
      // 如果还在加载中，就在标题栏上显示一个圆形进度条
      titleContent.add(
        Expanded(
          flex: 1,
          child: Align(
            child: CupertinoActivityIndicator(),
            alignment: Alignment.centerRight,
          ),
        ),
      );
    }
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return WillPopScope(
      onWillPop: () async {
        _onBack();
      },
      child: WebviewScaffold(
        key: _scaffoldKey,
        url: widget.url, // URL
        appBar: new AppBar(
          title: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: titleContent,
          ),
          iconTheme: new IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _onBack,
          ),
        ),
        withZoom: true, // 允许网页缩放
        withLocalStorage: true, // 允许LocalStorage
        withJavascript: true, // 允许执行js代码
      ),
    );
  }

  void _onBack() async {
    if (_history.length > 1) {
      await _flutterWebViewPlugin.goBack();
      _history.removeLast();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // 回收相关资源
    // Every listener should be canceled, the same should be done with this stream.
    _onStateChanged.cancel();
    _flutterWebViewPlugin.dispose();
    _history.clear();
    super.dispose();
  }
}
