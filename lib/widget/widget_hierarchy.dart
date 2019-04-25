import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/hierarchy.dart';
import 'package:flutter_wan_android/pages/hierarchy_detail.dart';

class HierarchyItemWidget extends StatelessWidget {
  final Category category;

  HierarchyItemWidget({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _itemContentWidget(),
            IconButton(
              icon: Icon(Icons.arrow_right),
              onPressed: () {},
            )
          ],
        ),
      ),
      onTap: () {
        _onTap(context);
      },
    );
  }

  void _onTap(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HierarchyDetailPage(
        category: category,
      );
    }));
  }

  List<Widget> _tagWidgets() {
    return category.children
        .map(
          (e) => Text(
                e.name,
                textAlign: TextAlign.left,
              ),
        )
        .toList();
  }

  Widget _itemContentWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[_titleWidget(), _tagContainer()],
      ),
    );
  }

  Widget _tagContainer() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: _tagWidgets(),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Text(
        category.name,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
