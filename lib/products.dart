import 'package:flutter/material.dart';
import 'package:flutter_app/details/product_details.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

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
                onPressed: () => Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductDetails(
                              products[index]['title'],
                              products[index]['image'],
                            ),
                      ),
                    ).then((bool value) {
                      if(value){
                        deleteProduct(index);
                      }

                    }),
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
