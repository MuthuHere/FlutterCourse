import 'package:flutter/material.dart';
import 'package:flutter_app/widget/product/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_medels/main.dart';

class HomePage extends StatefulWidget {
  final MainModel mainModel;

  HomePage(this.mainModel);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.mainModel.fetchProduct();
    super.initState();
  }

  _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Choose'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              "Manage Products",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(
                model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {
                model.toggleDisplayMode();
              },
            );
          })
        ],
        title: Text(
          "Easy List",
          textAlign: TextAlign.center,
        ),
      ),
      body: Products(),
    );
  }
}
