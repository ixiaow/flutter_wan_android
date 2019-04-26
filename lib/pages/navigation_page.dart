import 'package:flutter/material.dart';
import 'package:flutter_wan_android/service/service_method.dart';
import 'package:flutter_wan_android/widget/widget_future_build.dart';
import 'package:flutter_wan_android/model/navigation.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: FutureBuilderWidget(
            future: getNavigation(),
            contentWidget: (data) => NavigationListWidget(data: data)),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.4,
      title: Text('导航'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }
}

class NavigationListWidget extends StatefulWidget {
  final List<NavigationContent> data;

  NavigationListWidget({Key key, @required this.data}) : super(key: key);

  _NavigationListWidgetState createState() => _NavigationListWidgetState();
}

class _NavigationListWidgetState extends State<NavigationListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (index, bol) {},
        children: _expansionPanelList(),
      ),
    );
  }

  List<ExpansionPanel> _expansionPanelList() {
    return widget.data
        .map((e) => ExpansionPanel(
              isExpanded: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(e.name),
                );
              },
              body: new Padding(
                padding: EdgeInsets.all(30.0),
                child: new ListBody(
                  // gichildren: _expansionPanelContent(e.articles)
                ),
              ),
            ))
        .toList();
  }

  // List<Widget> _expansionPanelContent(List<Article>){
  //   return 
  // }
}
