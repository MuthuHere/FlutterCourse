import 'package:flutter/material.dart';
import 'dart:async';

class ProductDetails extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductDetails(this.title, this.imageUrl);

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
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme
                    .of(context)
                    .accentColor,
                child: Text('DELETE'),
                onPressed: () {
                  showDialog(context: context,builder: (BuildContext context) {
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
                          child: Text('CONTINUE'),
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
