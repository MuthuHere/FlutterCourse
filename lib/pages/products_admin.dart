import 'package:flutter/material.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/pages/product_edit.dart';
import 'package:flutter_app/pages/product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;

  final List<Product> _products;

  ProductAdminPage(this.addProduct, this.deleteProduct, this._products,this.updateProduct);

  _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Choose'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop_two),
            title: Text(
              "ALL Products",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, "/home");
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
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
        body: TabBarView(children: <Widget>[
          ProductEditPage(addProduct: addProduct),
          ProductListPage(this._products,updateProduct,deleteProduct)
        ]),
      ),
    );
  }
}
