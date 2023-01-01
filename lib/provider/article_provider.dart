import 'package:flutter/cupertino.dart';
import '../model/articles_model.dart';
import '../services/article_service.dart';

class ArticleProvider with ChangeNotifier {
  List<ArticlesModel> _articles = [];

  List<ArticlesModel> get articles => _articles;

  set articles(List<ArticlesModel> articles) {
    _articles = articles;
    notifyListeners();
  }

  Future<void> getArticles() async {
    try {
      List<ArticlesModel> articles = await ArticleService().getArticles();
      _articles = articles;
    } catch (e) {
      print(e);
    }
  }
}
