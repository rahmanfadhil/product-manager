import 'package:flutter/material.dart';

import 'products.dart';
import 'product_create.dart';
import 'product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductsPage()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Product Admin'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Create Product",
                icon: Icon(Icons.create),
              ),
              Tab(
                text: "My Products",
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}
