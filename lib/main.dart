import 'package:flutter/material.dart';
import 'package:flutter_app/details/product_details.dart';
import 'package:flutter_app/pages/auth.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/products_admin.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/scoped_medels/main.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
          theme: ThemeData(
              brightness: Brightness.light,
              accentColor: Colors.deepPurple,
              buttonColor: Colors.deepPurpleAccent,
              primarySwatch: Colors.deepOrange,
              buttonTheme: ButtonThemeData()),
          routes: {
            '/': (BuildContext context) => AuthPage(),
            '/home': (BuildContext context) => HomePage(mainModel),
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
                builder: (BuildContext context) => ProductDetails(index),
              );
            }
            return null;
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => HomePage(mainModel));
          }),
    );
  }
}
