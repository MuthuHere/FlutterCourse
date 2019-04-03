import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/product_manager.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
          accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Easy List",
              textAlign: TextAlign.center,
            ),

          ),
          body: ProductManager("Food Tester")),
    );
  }
}
