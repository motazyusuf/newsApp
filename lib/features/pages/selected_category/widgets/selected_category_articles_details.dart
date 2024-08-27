import 'package:flutter/material.dart';
import 'package:news_app/models/articels_model.dart';

class SelectedCategoryArticlesDetails extends StatefulWidget {
  SelectedCategoryArticlesDetails({super.key, required this.singleArticleList});

  List<SingleArticle> singleArticleList;


  @override
  State<SelectedCategoryArticlesDetails> createState() =>
      _SelectedCategoryArticlesDetailsState();
}

class _SelectedCategoryArticlesDetailsState
    extends State<SelectedCategoryArticlesDetails> {

  @override
  Widget build(BuildContext context) {

    print("list length ->>> ${widget.singleArticleList.length}");
    var theme = Theme.of(context);
    return ListView.builder(
      itemCount: widget.singleArticleList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),

          // article item
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              Text(
                widget.singleArticleList[index].source.name ,
                textAlign: TextAlign.start,
              ),
              Text(
                widget.singleArticleList[index].title,
                style: theme.textTheme.displayLarge,
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
