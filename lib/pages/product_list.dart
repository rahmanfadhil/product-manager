import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
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
        );
      },
    );
  }
}
