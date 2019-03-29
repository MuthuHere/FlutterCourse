import 'package:flutter/material.dart';
import 'package:flutter_app/products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Taster'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _products.add("Advanced Food Taster");
              });
            },
            child: Text("Add Product"),
          ),
        ),
        Products(_products)
      ],
    );
  }
}
