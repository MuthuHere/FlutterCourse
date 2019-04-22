import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app/widget/product/price_tag.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;


  ProductDetails(this.title, this.imageUrl, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    title,
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
                padding: EdgeInsets.symmetric(horizontal: 4.5, vertical: 2.5),
                child: Text(description),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.5, vertical: 2.5),
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
                color: Theme.of(context).accentColor,
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
      ),
    );
  }
}
