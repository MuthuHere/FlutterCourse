import 'package:flutter/material.dart';

import 'package:flutter_app/product_control.dart';
import 'package:flutter_app/products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {

  final List<String> _products =  [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

 @override
  void didUpdateWidget(ProductManager oldWidget) {
    print(_products);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(child: Products(_products))
      ],
    );
  }


  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }
}
