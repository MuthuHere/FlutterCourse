import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<AuthPage> {
  GlobalKey<FormState> _globalKey = GlobalKey();

  final String regexForEmail =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  final Map<String, dynamic> _formField = {
    "email": null,
    'password': null,
    'isChecked': false
  };

  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildUserNameTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress ,
      decoration: InputDecoration(
          hintText: 'Username', filled: true, fillColor: Colors.white),
      textInputAction: TextInputAction.next,
      focusNode: FocusNode(),
      validator: (String value) {
        if (value.isEmpty || !RegExp(regexForEmail).hasMatch(value)) {
          return 'Username required & should be an Email';
        }
      },
      onSaved: (String value) {
        _formField['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password required & 6+ chars';
        }
      },
      onSaved: (String value) {
        _formField['password'] = value;
      },
      scrollPadding: EdgeInsets.all(5.0),
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formField['isChecked'],
      title: Text('Accept Terms'),
      onChanged: (bool value) {
        setState(() {
          _formField['isChecked'] = value;
        });
      },
    );
  }

  void _btnSubmitTapped() {
    if (!_globalKey.currentState.validate() || !_formField['isChecked']) {
      return;
    }
    _globalKey.currentState.save();
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    final double targetWidth = deviceWidth > 550 ? 500.0 : deviceWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Form(
          key: _globalKey,
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                image: _buildBackgroundImage(),
              ),
              padding: EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: targetWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildUserNameTextField(),
                        SizedBox(height: 10.0),
                        _buildPasswordTextField(),
                        _buildAcceptSwitch(),
                        RaisedButton(
                          child: Text('LOGIN'),
                          onPressed: _btnSubmitTapped,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
