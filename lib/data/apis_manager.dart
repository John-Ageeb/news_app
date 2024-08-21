import 'dart:convert';

import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:http/http.dart';

class ApisManager {
  static String _apiKey = "2b1d126ab96b44e48e7d202111b572a1";
  static String _baseUrl = "https://newsapi.org";
  static String _sourceEndPoint = "/v2/top-headlines/sources";
  static String _articalEndPoint = "/v2/everything";

  static Future<SourcesResponse> getSources() async {
    Response serverResponse =
        await get(Uri.parse('$_baseUrl$_sourceEndPoint?apiKey=$_apiKey'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body)
          as Map; // to convert body from string to map
      SourcesResponse response = SourcesResponse.fromJson(
          json); // convertt from Json (map) to variables
      print(response.sources);
      return response;
    } else {
      throw "Somthing went wrong";
    }
  }

  static Future<ArticleResponse> getArtical(String souceId) async {
    Response serverResponse = await get(Uri.parse(
        '$_baseUrl$_articalEndPoint?apiKey=$_apiKey&sources=$souceId'));
    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      Map json = jsonDecode(serverResponse.body)
          as Map; // to convert body from string to map
      return ArticleResponse.fromJson(
          json); // convertt from Json (map) to variables
    } else {
      throw "Somthing went wrong";
    }
  }
}
