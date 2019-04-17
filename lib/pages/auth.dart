import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String emailValue = '';
  String passwordValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "E-Mail"),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  emailValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  passwordValue = value;
                });
              },
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text('LOGIN'),
              onPressed: () {
                print(emailValue);
                print(passwordValue);
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        ),
      ),
    );
  }
}
