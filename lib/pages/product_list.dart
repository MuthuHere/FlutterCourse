import 'package:flutter/material.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  Function updateProduct;
  Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);



  Widget _buildEditButton(BuildContext context, int index){
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage(
                product: products[index],
                productIndex: index,
                updateProduct: updateProduct,
              );
            },
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(color: Colors.red),
          key: Key(products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            }else if (direction == DismissDirection.startToEnd){
              print('Start to End');
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price.toString()}'),
                trailing:_buildEditButton(context,index) ,
                selected: false,
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
