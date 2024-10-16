import 'package:flutter/material.dart';

class CategoryObject {
  final String categoryID;
  final String categoryName;
  final Color categoryBackgroundColor;
  final String categoryImagePath;

  CategoryObject(
      {required this.categoryID,
      required this.categoryName,
      required this.categoryBackgroundColor,
      required this.categoryImagePath});
}
