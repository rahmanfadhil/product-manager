import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(title),
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('DELETE'),
            onPressed: () => Navigator.pop(context, true),
          )
        ],
      ),
    );
  }
}
