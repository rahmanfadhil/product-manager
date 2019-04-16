import 'package:flutter/material.dart';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    print('[ProductManager] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager] createState');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    print('[ProductManagerState] initState');
    _products.add(widget.startingProduct);
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[ProductManagerState] didUpdateWidget');
  }

  void _addProduct(String product) {
    setState(() {
      _products.add('Advanced super tools');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManagerState] build');

    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(_addProduct),
      ),
      Expanded(child: Products(_products)),
    ]);
  }
}
