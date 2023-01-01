import 'package:final_project/model/news_model.dart';
import 'package:final_project/services/news_service.dart';
import 'package:flutter/cupertino.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> _news = [];

  List<NewsModel> get news => _news;

  set articles(List<NewsModel> news) {
    _news = news;
    notifyListeners();
  }

  Future<void> getNews() async {
    try {
      List<NewsModel> news = await NewsService().getNews();
      _news = news;
    } catch (e) {
      print(e);
    }
  }
}
