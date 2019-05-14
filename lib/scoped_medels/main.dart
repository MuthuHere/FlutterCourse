

import 'package:flutter_app/scoped_medels/products.dart';
import 'package:flutter_app/scoped_medels/user.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_medels/connected_products.dart';

class MainModel extends Model with ConnectedProducts ,UserModel, ProductsModel{

}