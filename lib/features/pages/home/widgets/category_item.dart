import 'package:flutter/material.dart';

import '../../../../models/category.dart';

class CategoryItem extends StatelessWidget {

  CategoryItem({super.key, required this.index, required this.category});

  Category category;
  int index;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: category.categoryBackgroundColor,
        // image: DecorationImage(image: AssetImage(category.categoryImagePath)),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Expanded(child: Image.asset(category.categoryImagePath)),
            Text(
              category.categoryName,
              style: theme.textTheme.titleLarge?.copyWith(
                  height: 0, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
