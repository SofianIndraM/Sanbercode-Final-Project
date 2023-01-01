import 'package:equatable/equatable.dart';
import 'package:final_project/model/source_model.dart';

class ArticlesModel extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  late final String urlToImage;
  final String publishedAt;
  final String content;
  final SourceModel source;

  ArticlesModel({
    this.title = '',
    this.author = '',
    required this.description,
    this.url = '',
    this.urlToImage = '',
    this.publishedAt = '',
    this.content = '',
    required this.source,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
        source: SourceModel.fromJson(json['source']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
        'source': source.toJson(),
      };

  @override
  List<Object?> get props => [
        title,
        author,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
        source,
      ];
}
