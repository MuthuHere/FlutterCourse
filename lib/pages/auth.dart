import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<AuthPage> {
  String _username, _password;
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
    return TextField(
      decoration: InputDecoration(
          hintText: 'Username', filled: true, fillColor: Colors.white),
      textInputAction: TextInputAction.next,
      focusNode: FocusNode(),
      onChanged: (String value) {
        setState(() {
          _username = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      textInputAction: TextInputAction.done,
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
      scrollPadding: EdgeInsets.all(5.0),
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password', filled: true, fillColor: Colors.white),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      title: Text('Accept Terms'),
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _btnSubmitTapped() {
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
    );
  }
}
