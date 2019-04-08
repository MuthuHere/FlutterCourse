import 'package:flutter/material.dart';
import 'dart:async';

class ProductDetails extends StatelessWidget {
  final String title;
  final String image;

  ProductDetails(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context,false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(image),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () => Navigator.pop(context, true),
              ),
            )
          ],
        ),
      ),
    );
  }
}
