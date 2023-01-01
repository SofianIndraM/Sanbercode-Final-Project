import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/articles_model.dart';

class ArticleService {
  Future<List<ArticlesModel>> getArticles() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e2afa88dfaca41c6ae1c1bc0b64d3f69';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      List<ArticlesModel> articles = [];

      for (var item in data) {
        articles.add(ArticlesModel.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Gagal get Articles!');
    }
  }
}
