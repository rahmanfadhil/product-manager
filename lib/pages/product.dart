import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text('Details!'),
          RaisedButton(
            child: Text('Go back'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
