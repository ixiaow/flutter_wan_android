import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/model/swiper_item.dart';

class SwiperWidget extends StatefulWidget {
  final SwiperBean banner;
  SwiperWidget({Key key, @required this.banner}) : super(key: key);

  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  List<SwiperBeanItem> _items;
  @override
  void initState() {
    _items = widget.banner.swiperBeanItems ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: _items.length <= 0,
      child: Container(
        margin: EdgeInsets.all(1.0),
        height: 230.0,
        child: Swiper(
          itemHeight: 230.0,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              _items[index].imagePath,
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          pagination: CustomPagination(items: _items),
          onTap: (index) {
            print('${_items[index].title} 被点击了');
          },
        ),
      ),
    );
  }
}

class CustomPagination extends SwiperPlugin {
  List<SwiperBeanItem> items;
  CustomPagination({@required this.items});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          color: Colors.grey,
          height: 20.0,
          child: _indicator(context, config)),
    );
  }

  Widget _indicator(BuildContext context, SwiperPluginConfig config) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(items[config.activeIndex].title),
        Expanded(
          child: Align(
            child: SwiperPagination.dots.build(context, config),
            alignment: Alignment.centerRight,
          ),
        )
      ],
    );
  }
}
