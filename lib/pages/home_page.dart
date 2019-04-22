import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/asset_image.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_swiper.dart';
import 'package:flutter_wan_android/model/swiper_item.dart';
import 'package:flutter_wan_android/model/home_artical.dart';
import 'package:flutter_wan_android/widget/widget_home_artical.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: Container(
        child: FutureBuilder(
          future: getHomeData(),
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            return _builder(context, snapShot);
          },
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapShot) {
    switch (snapShot.connectionState) {
      case ConnectionState.waiting:
        return Center(child: RefreshProgressIndicator());
      case ConnectionState.done:
        if (snapShot.hasError) {
          return Center(
            child: Text('数据加载失败, ${snapShot.error}'),
          );
        } else if (snapShot.hasData) {
          return _homeContnet(snapShot.data);
        }
        return Center();
      default:
        return Center();
    }
  }

  int _getListItemCount(List<dynamic> dataList) {
    try {
      return 1 + (dataList[1] as HomeArtical).data.datas.length;
    } catch (e) {
      return 0;
    }
  }

  Widget _homeContnet(List<dynamic> dataList) {
    return ListView.builder(
      itemCount: _getListItemCount(dataList),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SwiperWidget(banner: dataList[0] as SwiperBean);
        } else {
          return HomeArticalWidget(
              artical: (dataList[1] as HomeArtical).data.datas[index - 1]);
        }
      },
    );
  }

  Widget _appBar() {
    return AppBar(
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
