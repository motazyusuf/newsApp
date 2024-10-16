import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_routes_names.dart';
import 'package:news_app/models/articels_model.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.sizeOf(context).width;
    var article = ModalRoute.of(context)!.settings.arguments as SingleArticle ;
    print(article);
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
          appBar: AppBar(
        iconTheme: theme.iconTheme,
        title: Text(
          article.source.name,
          style: theme.textTheme.titleLarge,
        ),
      ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Container(margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:NetworkImage(
                      article.urlToImage!)),
              borderRadius: BorderRadius.circular(15))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  article.source.name,
                  style: theme.textTheme.displayMedium!.copyWith(fontSize: 10),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                  Text(
                    article.title,
                    style: theme.textTheme.displayMedium!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(article.content!.contains("[") ? article.content!.substring(0,200) : article.content!, style: theme.textTheme.displayMedium!
                  .copyWith(fontSize: 17),),
            ),
            const Spacer(),
            Container(margin: EdgeInsets.only(left: width/1.7,),
                child: FilledButton(style: FilledButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                  Navigator.pushNamed(context, PagesRoutesNames.webView, arguments: article);
                    },
                    child: Text("View full article",
                        style: theme.textTheme.displayMedium!
                            .copyWith(fontWeight: FontWeight.bold,fontSize: 12, color: Color(0xff42505C)))))
          ],
        ),
      ),

    );
  }
}
