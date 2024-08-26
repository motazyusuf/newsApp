import 'package:flutter/material.dart';

class Category {
  final String categoryID;
  final String categoryName;
  final Color categoryBackgroundColor;
  final String categoryImagePath;

  Category(
      {required this.categoryID,
      required this.categoryName,
      required this.categoryBackgroundColor,
      required this.categoryImagePath});
}
