import 'package:flutter/material.dart';
import 'package:news_app/models/articels_model.dart';

import '../../../../core/config/pages_routes_names.dart';

class SelectedCategoryArticlesComponent extends StatefulWidget {
  SelectedCategoryArticlesComponent({super.key, required this.singleArticleList});

  List<SingleArticle> singleArticleList;

  @override
  State<SelectedCategoryArticlesComponent> createState() =>
      _SelectedCategoryArticlesDetailsState();
}

class _SelectedCategoryArticlesDetailsState
    extends State<SelectedCategoryArticlesComponent> {
  @override
  Widget build(BuildContext context) {
    // print("list length ->>> ${widget.singleArticleList.length}");
    var theme = Theme.of(context);
    return ListView.builder(
      itemCount: widget.singleArticleList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),

          // article item
          child: InkWell(onTap: () => Navigator.pushNamed(
              context, PagesRoutesNames.articleDescription,
              arguments: widget.singleArticleList[index]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:NetworkImage(
                                  widget.singleArticleList[index].urlToImage!)),
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(height: 10),
                Text(
                  widget.singleArticleList[index].source.name,
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.singleArticleList[index].title,
                  style: theme.textTheme.displayLarge,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
