import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int _selProductIndex;
  bool _isLoading = false;

  Future<Null> addProduct(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://amp.thisisinsider.com/images/5a395a06fcdf1e2d008b461b-750-563.jpg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id,
    };
    return http
        .post('https://flutter-products-e9bec.firebaseio.com/products.json',
            body: json.encode(productData))
        .then(
      (http.Response response) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        final Product newProduct = Product(
            id: responseData['name'],
            title: title,
            description: description,
            image: productData['image'],
            price: price,
            userEmail: _authenticatedUser.email,
            userId: _authenticatedUser.id);
        _products.add(newProduct);
        _isLoading = false;

        notifyListeners();
      },
    );
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  bool get displayFavoriteOnly {
    return _showFavorites;
  }

  Future<Null> updateProduct(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updatedData = {
      'title': title,
      'description': description,
      'image':
          'https://amp.thisisinsider.com/images/5a395a06fcdf1e2d008b461b-750-563.jpg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id,
    };

    return http
        .put(
            'https://flutter-products-e9bec.firebaseio.com/products/${selectedProduct.id}.json',
            body: json.encode(updatedData))
        .then(
      (http.Response response) {
        _isLoading = false;

        final Product newProduct = Product(
            id: selectedProduct.id,
            title: title,
            description: description,
            image: image,
            price: price,
            userEmail: _authenticatedUser.email,
            userId: _authenticatedUser.id);
        _products[selectedProductIndex] = newProduct;
        notifyListeners();
      },
    );
  }

  void deleteProduct() {
    _isLoading = true;
    final deletedProductId = selectedProduct.id;
    _products.removeAt(selectedProductIndex);
    _selProductIndex = null;
    notifyListeners();
    http
        .delete(
            'https://flutter-products-e9bec.firebaseio.com/products/$deletedProductId.json')
        .then((http.Response response) {
      _isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<Null> fetchProducts() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://flutter-products-e9bec.firebaseio.com/products.json')
        .then(
      (http.Response response) {
        final Map<String, dynamic> productListData = json.decode(response.body);
        final List<Product> fetchedProductList = [];

        if (productListData == null) {
          _isLoading = false;
          notifyListeners();
          return;
        }

        productListData.forEach((String productId, dynamic productData) {
          final product = Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            image: productData['image'],
            price: productData['price'],
            userEmail: productData['userEmail'],
            userId: productData['userId'],
          );
          fetchedProductList.add(product);
        });

        _products = fetchedProductList;
        _isLoading = false;

        notifyListeners();
      },
    );
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavourite =
        _products[selectedProductIndex].isFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: !isCurrentlyFavourite,
    );
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UsersModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser = User(id: 'asdfasdf', email: email, password: password);
  }
}

mixin UtilityModel on ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
