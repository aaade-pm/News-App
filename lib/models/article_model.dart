import 'package:daily_news/models/source_model.dart';

class Article {
  late Source source;
  String author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String publishedAt;
  String content;

  // creating constructor
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  //creating a factory function
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? json['publishedAt'],
      publishedAt: json['publishedAt'] as String,
      description: json['description'] ?? 'Default',
      title: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] ?? 'no image',
      content: json['content'] ?? 'Default content',
    );
  }
}
