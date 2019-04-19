import 'package:flutter/material.dart';

import './product_edit.dart';
import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ProductEditPage(
                  product: products[index],
                  updateProduct: updateProduct,
                  productIndex: index,
                ),
          ),
        );
      },
      icon: Icon(Icons.edit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].title),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              deleteProduct(index);
            } else if (direction == DismissDirection.endToStart) {
              print('Swipe end to start');
            } else {
              print('Other swiping');
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price.toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}
