import 'package:flutter/material.dart';

import '../../../../models/category_model.dart';

class CategoryItem extends StatelessWidget {

  CategoryItem({super.key, required this.index, required this.selectedCategory, required this.onCategoryTap});

  CategoryObject selectedCategory;
  int index;
  void Function(CategoryObject selectedCategory) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () => onCategoryTap(selectedCategory),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(
            bottomLeft:  index % 2 == 0 ? Radius.circular(15) : Radius.circular(0),
            bottomRight: index % 2 == 0 ? Radius.circular(0) : Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          ),
            color: selectedCategory.categoryBackgroundColor,

          // image: DecorationImage(image: AssetImage(category.categoryImagePath)),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Expanded(child: Image.asset(selectedCategory.categoryImagePath)),
              Text(
                selectedCategory.categoryName,
                style: theme.textTheme.titleLarge?.copyWith(
                    height: 0, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
