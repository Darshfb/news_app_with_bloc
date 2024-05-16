import 'package:news_udemy_course/core/app_strings.dart';

class NewsModel {
  String? title, author, urlToImage, publishedAt, description;

  NewsModel({
    required this.title,
    required this.author,
    required this.urlToImage,
    required this.description,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? "",
      author: json['author'] ?? "",
      urlToImage: json['urlToImage'] ?? AppStrings.defaultImage,
      description: json['description'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
    );
  }
}
