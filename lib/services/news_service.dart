import 'dart:convert';

import 'package:final_project/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NewsModel>> getNews() async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=Fox-News&apiKey=e2afa88dfaca41c6ae1c1bc0b64d3f69';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      List<NewsModel> news = [];

      for (var item in data) {
        news.add(NewsModel.fromJson(item));
      }
      return news;
    } else {
      throw Exception('Gagal get News!');
    }
  }
}
