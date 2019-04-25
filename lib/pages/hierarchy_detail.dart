import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/hierarchy.dart';
import 'hierarchy_detail_content_page.dart';

class HierarchyDetailPage extends StatefulWidget {
  final Category category;
  HierarchyDetailPage({Key key, @required this.category}) : super(key: key);

  _HierarchyDetailPageState createState() => _HierarchyDetailPageState();
}

class _HierarchyDetailPageState extends State<HierarchyDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.category.children.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(widget.category.name),
        automaticallyImplyLeading: true,
        bottom: TabBar(
          tabs: _tabs(),
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContents(),
      ),
    );
  }

  List<Widget> _tabContents() => widget.category.children
      .map((e) => HierarchyDetailContentPage(detailTag: e))
      .toList();

  List<Widget> _tabs() => widget.category.children
      .map(
        (e) => Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                e.name,
                maxLines: 1,
              ),
            ),
      )
      .toList();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
