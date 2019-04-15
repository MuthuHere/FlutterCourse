import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/product_create.dart';
import 'package:flutter_app/pages/product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdminPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: Text(
                  "ALL Products",
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, "/");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage Product'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'Add Product',
              icon: Icon(Icons.edit),
            ),
            Tab(
              text: 'Manage Product',
              icon: Icon(Icons.list),
            )
          ]),
        ),
        body: TabBarView(
            children: <Widget>[ProductCreatePage(addProduct), ProductListPage()]),
      ),
    );
  }
}
