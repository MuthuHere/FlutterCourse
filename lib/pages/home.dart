import 'package:flutter/material.dart';
import 'package:flutter_app/product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;


  HomePage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Text(
                  "Manage Products",
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Easy List",
            textAlign: TextAlign.center,
          ),
        ),

        body: ProductManager(products),
    );
  }
}
