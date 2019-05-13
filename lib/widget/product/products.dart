import 'package:flutter/material.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/scoped_medels/products.dart';
import 'package:flutter_app/widget/product/product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_medels/products.dart';
import '../../models/product-model.dart';


class Products extends StatelessWidget {

  //loading list
  Widget _buildProductList(List<Product> products) {
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



  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child,ProductsModel model){
      return _buildProductList(model.displayedProducts);
    },);

    //
  }
}
