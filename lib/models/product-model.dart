import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;

  final String email;
  final String userID;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      @required this.email,
      @required this.userID,
      this.isFavorite = false});
}
