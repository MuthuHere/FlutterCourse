import 'package:flutter/material.dart';
import 'package:flutter_app/product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "EasyList",
            ),
          ),
          body: ProductManager()),
    );
  }
}
