import 'package:news_app/models/sources_model.dart';

class ArticlesModel{

final String status;
final List<SingleArticle> articles;

  ArticlesModel({required this.status, required this.articles});


  factory ArticlesModel.fromJson(Map<String, dynamic> json){
    return ArticlesModel(
        status: json["status"],
        articles: (json["articles"] as List).map(
                (article) => SingleArticle.fromJson(article)
        ).toList()
    );
  }

}

class SingleArticle {

  final SingleSource source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String publishedAt;
  final String? urlToImage;
  final String? content;

  SingleArticle(
      {required this.source,
       this.author,
      required this.title,
       this.description,
      required this.url,
       this.urlToImage,
       this.content,
      required this.publishedAt});

  factory SingleArticle.fromJson(Map<String, dynamic> json){
    return SingleArticle(
        source: SingleSource.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage:json["urlToImage"] ,
        content: json["content"],
        publishedAt: json["publishedAt"]);
  }



}
