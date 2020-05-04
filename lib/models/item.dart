import 'package:flutter/material.dart';

class Item {
  final String imageUrl;
  final String name;
  final String brand;
  final double star;
  final int commentCount;
  final int price;
  final bool isTaxIncluded;

  Item({
    @required this.imageUrl,
    @required this.name,
    @required this.brand,
    this.star,
    this.commentCount,
    this.price,
    this.isTaxIncluded,
  });
}
