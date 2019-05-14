import 'package:flutter_app/models/product-model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  User _authendicationUser;
  int _selProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = new Product(
        title: title,
        description: description,
        price: price,
        image: image,
        email: _authendicationUser.email,
        userID: _authendicationUser.id);
    _products.add(newProduct);
    notifyListeners();
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
