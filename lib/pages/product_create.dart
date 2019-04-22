import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  String productTitle = '';
  String prodDescription = '';
  String productPrice = '';

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      child: Card(
        margin: EdgeInsets.all(15.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Product Title"),
              keyboardType: TextInputType.text,
              onChanged: (String value) {
                setState(() {
                  productTitle = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Product Description"),
              keyboardType: TextInputType.text,
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  prodDescription = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Product Price"),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  productPrice = value;
                });
              },
            ),
            SizedBox(height: 15.0),
            RaisedButton(
              padding: EdgeInsets.all(2.0),
              textColor: Colors.white,
              child: Text('Save'),
              onPressed: () {
                final Map<String, dynamic> map = {
                  'title': productTitle,
                  'description': prodDescription,
                  'price': productPrice,
                  'image': 'assets/food.jpg'
                };
                widget.addProduct(map);
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
