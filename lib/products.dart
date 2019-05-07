import 'package:flutter/material.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/widget/product/product_card.dart';

class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  //loading list
  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

/*
  Widget _buildProductList() {
   return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildList,
            itemCount: products.length,
          )
        : Center(
            child: Text('No products found, please add'),
          );
  }
*/

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
