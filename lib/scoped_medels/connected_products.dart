import 'package:flutter_app/models/product-model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  User _authendicationUser;
  int _selProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Map<String, dynamic> productData = {
      "title": title,
      "description": description,
      "image":
          'http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/foodie0315-philadelphia.jpg?itok=YMsUdwdF',
      "price": price,
      "userEmail": _authendicationUser.email,
      "userID": _authendicationUser.id,
    };
    http
        .post('https://flutter-products-e88ac.firebaseio.com/products.json',
            body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      final Product newProduct = new Product(
          id: responseData['name'],
          title: title,
          description: description,
          price: price,
          image: image,
          email: _authendicationUser.email,
          userID: _authendicationUser.id);

      _products.add(newProduct);
      notifyListeners();
    });
  }
}

mixin UserModel on ConnectedProductsModel {
  void login(String email, String pwd) {
    _authendicationUser = User(id: "abc", email: email, password: pwd);
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (_selProductIndex == null) {
      return null;
    }
    return _products[_selProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updateProduct = new Product(
        title: title,
        description: description,
        price: price,
        image: image,
        email: selectedProduct.email,
        userID: selectedProduct.userID);

    _products[selectedProductIndex] = updateProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

  void fetchProduct() {
    http
        .get('https://flutter-products-e88ac.firebaseio.com/products.json')
        .then((http.Response response) {
      final List<Product> productList = [];

      final Map<String, dynamic> productData = json.decode(response.body);

      productData.forEach((String productID,dynamic productData) {
        final Product product = Product(
            id: productID,
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            image: productData['image'],
            email: productData['userEmail'],
            userID: productData['userID']);

        productList.add(product);
      });
      _products = productList;
      notifyListeners();
    });
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        email: _authendicationUser.email,
        userID: _authendicationUser.id,
        isFavorite: newFavoriteStatus);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
