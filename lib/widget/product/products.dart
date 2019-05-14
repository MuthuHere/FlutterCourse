import 'package:flutter/material.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/widget/product/product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_medels/main.dart';
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

    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child,MainModel model){
      return _buildProductList(model.displayedProducts);
    },);

    //
  }
}
