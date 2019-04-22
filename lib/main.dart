import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() => runApp(WanAndroid());

class WanAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }
    return MaterialApp(
      title: "WanAndroid",
      theme: ThemeData(primarySwatch: Colors.green),
      home: IndexPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
