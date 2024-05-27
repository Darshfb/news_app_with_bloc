import 'package:equatable/equatable.dart';
import 'package:news_udemy_course/core/app_strings.dart';

class NewsModel extends Equatable {
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

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "author": author,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "description": description
    };
  }

  @override
  List<Object?> get props => [
        title,
        author,
        urlToImage,
        description,
        publishedAt,
      ];
}
