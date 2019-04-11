import 'package:flutter/material.dart';
import 'package:flutter_app/details/product_details.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/products_admin.dart';

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
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            brightness: Brightness.light,
            accentColor: Colors.deepPurple),
        routes: {
          '/': (BuildContext context) =>
              HomePage(_products, _addProduct, _deleteProduct),
          '/admin': (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> productElement = settings.name.split('/');

          if (productElement[0] != '') {
            return null;
          }

          if (productElement[1] == 'product') {
            final int index = int.parse(productElement[2]);

            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductDetails(
                    _products[index]['title'],
                    _products[index]['image'],
                  ),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomePage(_products, _addProduct, _deleteProduct));
        });
  }
}
