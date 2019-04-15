import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              ),
            ],
          )
        ],
      ),
    );
  }

  //loading list
  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildList,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No products found, please add'),
      );
    }
    return productCard;
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
