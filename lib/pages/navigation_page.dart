import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/asset_image.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: _drawer(),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
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
