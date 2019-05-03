import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  int productIndex;

  final Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.updateProduct, this.product,this.productIndex});

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

  final GlobalKey<FormState> _globalKey = GlobalKey();

  Widget _buildProductTitle() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Title"),
      initialValue: widget.product == null ? '' : widget.product['title'],
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return "Title Required & should be 5+ Characters";
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildProductDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Description"),
      initialValue: widget.product == null ? '' : widget.product['description'],
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

  Widget _buildProductPrice() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
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

  void _submitForm() {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();

    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex,_formData);
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;

    final Widget pageContent = GestureDetector(
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
              _buildProductTitle(),
              _buildProductDescription(),
              _buildProductPrice(),
              SizedBox(height: 15.0),
              RaisedButton(
                padding: EdgeInsets.all(2.0),
                textColor: Colors.white,
                child: Text('Save'),
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
