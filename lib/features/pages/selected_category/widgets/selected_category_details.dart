import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_routes_names.dart';
import 'package:news_app/features/pages/selected_category/widgets/selected_category_articles_component.dart';
import 'package:news_app/features/pages/selected_category/widgets/tabBar_item.dart';
import 'package:news_app/models/sources_model.dart';

import '../../../../core/network/api_manager.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../models/articels_model.dart';

class SelectedCategoryDetails extends StatefulWidget {
  SelectedCategoryDetails(
      {super.key, required this.singleSourceList, required this.categoryID});

  List<SingleSource> singleSourceList;
  String categoryID;

  @override
  State<SelectedCategoryDetails> createState() =>
      _SelectedCategoryDetailsState();
}

class _SelectedCategoryDetailsState extends State<SelectedCategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [

        // Sources
        DefaultTabController(
            length: widget.singleSourceList.length,
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: widget.singleSourceList
                    .map((source) => TabBarItem(
                          source: source,
                          isSelected: selectedIndex ==
                                  widget.singleSourceList.indexOf(source)
                              ? true
                              : false,
                        ))
                    .toList())),

        // Articles
        Expanded(
          child: widget.singleSourceList.isEmpty
              ? const Center(
                  child: Text(
                  "No Available Sources",
                  // style: theme.textTheme.titleLarge!
                  //     .copyWith(color: Colors.black),
                ))

              // List of Articles
              : FutureBuilder(
                  future: ApiManager.fetchArticlesList(
                      widget.singleSourceList == []
                          ? "sports"
                          : widget.singleSourceList[selectedIndex].id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("No Data Currently"));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorPalette.primaryColor,
                        ),
                      );
                    }

                    List<SingleArticle> singleArticleList = snapshot.data ?? [];

                    // articles Item
                    if(singleArticleList.isEmpty){
                      return Center(child: Text("No Articles Available"));
                    }
                    else {
                      return SelectedCategoryArticlesComponent(
                          singleArticleList: singleArticleList);
                    }
                  },
                ),
        )
      ],
    );
    ;
  }
}
