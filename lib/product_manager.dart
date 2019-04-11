import 'package:flutter/material.dart';

import 'package:flutter_app/product_control.dart';
import 'package:flutter_app/products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;

  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Text('Product List'),
        Expanded(child: Products(products, deleteProduct: deleteProduct))
      ],
    );
  }
}
