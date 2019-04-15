import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<AuthPage> {
  String _username, _password;
  bool _acceptTerms=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Username'),
                    onChanged: (String value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  TextField(
                    onChanged: (String value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    scrollPadding: EdgeInsets.all(5.0),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  SwitchListTile(
                    value:_acceptTerms,
                    title: Text('Accept Terms'),
                    onChanged: (bool value){
                      setState(() {
                        _acceptTerms = value;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('LOGIN'),
                    onPressed: () {
                      print("Username==> " + _username +
                          " <===== password =====>" + _password);
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
