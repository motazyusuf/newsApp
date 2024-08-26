import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/core/theme/color_palette.dart';
import 'package:news_app/features/pages/selected_category/widgets/selected_category_details.dart';
import 'package:news_app/features/pages/selected_category/widgets/tabBar_item.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_model.dart';

class SelectedCategoryView extends StatefulWidget {
  SelectedCategoryView({super.key, required this.selectedCategory});

  CategoryObject selectedCategory;

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiManager.fetchSourcesList(widget.selectedCategory.categoryID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error Fetching the Data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }

        List<SingleSource> singleSourceList = snapshot.data ?? [];


        return SelectedCategoryDetails(singleSourceList: singleSourceList);
      },
    );
  }
}
