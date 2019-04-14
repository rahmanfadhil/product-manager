import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print('[Products] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Products] Build');

    return Column(
      children: products
          .map((element) => Card(
                  child: Column(
                children: <Widget>[
                  Image.network('https://via.placeholder.com/400x250'),
                  Text(element)
                ],
              )))
          .toList(),
    );
  }
}
