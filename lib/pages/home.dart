
import 'package:flutter/material.dart';
import 'package:flutter_app/product_manager.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Easy List",
            textAlign: TextAlign.center,
          ),

        ),
        body: ProductManager());
  }

}