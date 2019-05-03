import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Function updateProduct;

  ProductListPage(this.products,this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(products[index]['title']),
          subtitle: Image.asset(products[index]['image']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProductEditPage(product: products[index],productIndex:index,updateProduct: updateProduct,);
                  },
                ),
              );
            },
          ),
          selected: false,
        );
      },
      itemCount: products.length,
    );
  }
}
