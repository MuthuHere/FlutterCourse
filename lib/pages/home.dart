import 'package:flutter/material.dart';
import 'package:flutter_app/products.dart';

class HomePage extends StatelessWidget {

  final List<Map<String, dynamic>> products;

  HomePage(this.products);

  _buildSideDrawer(BuildContext context){
   return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Choose'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.edit),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: (){},
          )
        ],
        title: Text(
          "Easy List",
          textAlign: TextAlign.center,
        ),
      ),
      body: Products(products),
    );
  }
}
