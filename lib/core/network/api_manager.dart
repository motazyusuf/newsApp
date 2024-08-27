import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/articels_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_model.dart';

class ApiManager{

 static Future<List<SingleSource>> fetchSourcesList(String categoryID) async {

    // constructing the URL
    var url = Uri.https(
      Constants.domain,
      "v2/top-headlines/sources",
        {
          "apiKey": Constants.apiKey,
          "category": categoryID
        }
    );

      // getting full response
      var response = await http.get(url);

      // request succeed
      if(response.statusCode ==200){

        // get  body of the response
        String responseJsonInString = response.body;

        // decode it from String to Json
        var jsonSourcesList = jsonDecode(responseJsonInString);
        print("Sources --> $jsonSourcesList");

        // from Json to SourcesModel
       SourcesModel sources = SourcesModel.fromJson(jsonSourcesList);

       // get the list of sources
        return sources.sources;
      }
      else{
        throw Exception("Failed to load sources");
      }
  }

  static Future<List<SingleArticle>> fetchArticlesList(String source) async{

    // construct the url
    var url = Uri.https(
        Constants.domain,
        "v2/top-headlines",
        {
          "apiKey": Constants.apiKey,
          "sources": source
        }
    );

    print("url --->> $url");

    // get full response
    var response = await http.get(url);

    // if succeed
    if(response.statusCode ==200){

      // get body of response in String form
      String responseJsonInString = response.body;

      // decode from String to Json
      var jsonArticlesList = jsonDecode(responseJsonInString);


      // from Json to ArticlesModel
      ArticlesModel articles = ArticlesModel.fromJson(jsonArticlesList);

      // get the list of articles

      print("Articles --> ${articles.articles[0]}");
      return articles.articles;

    }

    else{
      throw Exception("Failed to load Articles");
    }




  }

}