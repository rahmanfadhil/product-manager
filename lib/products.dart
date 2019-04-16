import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]) {
    print('[Products] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network('https://via.placeholder.com/400x250'),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products] Build');

    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    );
  }
}
