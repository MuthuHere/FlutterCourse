import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/scoped_medels/connected_products.dart';


mixin UserModel on ConnectedProducts{


  void login(String email,String pwd){
    authendicationUser = User(id: "abc", email: email, password: pwd);

  }


}