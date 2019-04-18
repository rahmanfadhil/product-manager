import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index]['title']),
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
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: IconButton(
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
                ),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}
