import 'package:flutter/material.dart';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(
    this.products,
    this.addProduct,
    this.deleteProduct,
  );

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState] build');

    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(addProduct),
      ),
      Expanded(child: Products(products, deleteProduct: deleteProduct)),
    ]);
  }
}
