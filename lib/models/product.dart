import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.price,
    @required this.userEmail,
    @required this.userId,
    this.isFavorite = false,
  });
}
