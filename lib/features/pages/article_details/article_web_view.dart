import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/articels_model.dart';

class ArticleWebView extends StatelessWidget {
  const ArticleWebView({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as SingleArticle;
    var theme = Theme.of(context);
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)..loadRequest(Uri.parse(article.url));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          article.source.name,
          style: theme.textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
