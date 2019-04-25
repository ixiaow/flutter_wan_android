import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/asset_image.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_swiper.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/widget/widget_home_artical.dart';
import 'package:flutter_wan_android/widget/widget_refresh.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/widget/widget_future_build.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: Container(
        child: FutureBuilderWidget(
          future: getHomeData(),
          contentWidget: (data) => HomeArticalRefreshListWidget(
                data: data,
              ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.4,
      title: Text('玩Android'),
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _drawer() {
    final List<Widget> _children = [
      UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage(ImagePath.avator_url),
        ),
        accountName: Text('test'),
        accountEmail: Text('test@test.com'),
      ),
      ListTile(
        leading: Icon(Icons.sentiment_dissatisfied),
      )
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: _children,
      ),
    );
  }
}

class HomeArticalRefreshListWidget extends StatefulWidget {
  final Map<String, dynamic> data;
  HomeArticalRefreshListWidget({Key key, @required this.data})
      : super(key: key);

  _HomeArticalWidgetState createState() => _HomeArticalWidgetState();
}

class _HomeArticalWidgetState extends State<HomeArticalRefreshListWidget> {
  List<dynamic> _data = List();
  final GlobalKey<RefreshHeaderState> _headerStateKey = GlobalKey();
  final GlobalKey<RefreshFooterState> _footerStateKey = GlobalKey();

  int _currentPage = 1;
  bool _loadMore = true;

  @override
  void initState() {
    _data
      ..add(widget.data['banner'])
      ..addAll(widget.data['topArtical'])
      ..addAll((widget.data['homeArtical'] as HomeArtical).data.datas);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      easyRefreshHeaderKey: _headerStateKey,
      easyLoadMoreHeaderKey: _footerStateKey,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SwiperWidget(banner: _data[0]);
          } else {
            return HomeArticalWidget(artical: _data[index]);
          }
        },
      ),
      onRefresh: () async {
        await getHomeData().then((result) {
          _data.clear();
          setState(() {
            _data
              ..add(widget.data['banner'])
              ..addAll(widget.data['topArtical'])
              ..addAll((widget.data['homeArtical'] as HomeArtical).data.datas);
            _currentPage = 1;
            _loadMore = true;
          });
        });
      },
      onLoadMore: _loadMore
          ? () async {
              await getHomeArtical(page: _currentPage).then((homeArtical) {
                setState(() {
                  _data.addAll(homeArtical.data.datas);
                  _currentPage++;
                  _loadMore = !homeArtical.data.over;
                });
              });
            }
          : null,
    );
  }
}
