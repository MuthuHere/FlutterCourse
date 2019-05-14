import 'package:flutter/material.dart';
import 'package:flutter_app/scoped_medels/main.dart';
import 'dart:async';

import 'package:flutter_app/widget/product/price_tag.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductDetails extends StatelessWidget {
  final int productIndex;

  ProductDetails(this.productIndex);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.allProducts[productIndex].title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(model.allProducts[productIndex].image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        model.allProducts[productIndex].title,
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PriceTag(
                      5.0.toString(),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.5, vertical: 2.5),
                    child: Text(model.allProducts[productIndex].description),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.5, vertical: 2.5),
                    child: Text(
                      "Paradigm Mall, Selangor, Malaysia",
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme
                        .of(context)
                        .accentColor,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Are you sure?'),
                              content: Text('This action cannot be undone!'),
                              actions: <Widget>[
                                RaisedButton(
                                  child: Text('DISCARD'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                RaisedButton(
                                  child: Text('DISCARD'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context, true);
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                )
              ],
            ),
          );

        },),


    );
  }
}
