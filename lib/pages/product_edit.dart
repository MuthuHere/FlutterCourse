import 'package:flutter/material.dart';
import 'package:flutter_app/helper/ensure-visible.dart';
import 'package:flutter_app/models/product-model.dart';
import 'package:flutter_app/scoped_medels/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  final _titleFocusNode = new FocusNode();

  final GlobalKey<FormState> _globalKey = GlobalKey();

  Widget _buildProductTitle(Product product) {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: "Product Title"),
        initialValue: product == null ? '' : product.title,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return "Title Required & should be 5+ Characters";
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildProductDescription(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Description"),
      initialValue: product == null ? '' :product.description,
      keyboardType: TextInputType.text,
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return "Description Required & should be 10+ Characters";
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildProductPrice(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      initialValue:
          product == null ? '' : product.price.toString(),
      validator: (String value) {
        if (value.isEmpty || double.tryParse(value) == null) {
          return "Price Required & should be number";
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm(Function addProduct, Function updateProduct,[int selectedIndex]) {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();

    if (selectedIndex == null) {
      addProduct(
        Product(
            title: _formData['title'],
            description: _formData['description'],
            price: _formData['price'],
            image: _formData['image']),
      );
    } else {
      updateProduct(
        Product(
            title: _formData['title'],
            description: _formData['description'],
            price: _formData['price'],
            image: _formData['image']),
      );
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext contxt, Widget child, ProductsModel model) {
        return RaisedButton(
          padding: EdgeInsets.all(2.0),
          textColor: Colors.white,
          child: Text('Save'),
          onPressed: () => _submitForm(model.addProduct, model.updateProduct,model.selectedProductIndex),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context,Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          key: _globalKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildProductTitle(product),
              _buildProductDescription(product),
              _buildProductPrice(product),
              SizedBox(height: 15.0),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext contxt, Widget child, ProductsModel model) {
       final Widget pageContent = _buildPageContent(context,model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
