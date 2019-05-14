import 'package:flutter_app/models/product-model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  User authendicationUser;
  int selProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = new Product(
        title: title,
        description: description,
        price: price,
        image: image,
        email: authendicationUser.email,
        userID: authendicationUser.id);
    products.add(newProduct);
    selProductIndex = null;
    notifyListeners();
  }
}
