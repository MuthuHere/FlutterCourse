import 'package:flutter/material.dart';
import 'package:flutter_app/details/product_details.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/pages/auth.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/products_admin.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.deepPurpleAccent,
            primarySwatch: Colors.deepOrange,
            buttonTheme: ButtonThemeData()),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => HomePage(_products),
          '/admin': (BuildContext context) =>
              ProductAdminPage(_addProduct, _deleteProduct, _products,_updateProduct),
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
                    _products[index].title,
                    _products[index].image,
                    _products[index].description,
                  ),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage(_products));
        });
  }
}
