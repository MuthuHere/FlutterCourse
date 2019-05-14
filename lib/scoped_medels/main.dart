

import 'package:scoped_model/scoped_model.dart';

import '../scoped_medels/connected_products.dart';

class MainModel extends Model with ConnectedProductsModel ,UserModel, ProductsModel{

}