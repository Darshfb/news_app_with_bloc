import 'package:news_udemy_course/data/news_model.dart';

enum NewsStatus { loading, success, error }

class NewsStates {
  final NewsStatus homeStatus;
  final NewsStatus categoryStatus;
  final List<NewsModel> homeNewsList;
  final List<NewsModel> categoryNewsList;
  final String homeError;
  final String categoryError;

  NewsStates({
    this.homeStatus = NewsStatus.loading,
    this.categoryStatus = NewsStatus.loading,
    this.homeNewsList = const [],
    this.categoryNewsList = const [],
    this.homeError = '',
    this.categoryError = '',
  });

  NewsStates copyWith({
    NewsStatus? homeStatus,
    NewsStatus? categoryStatus,
    List<NewsModel>? homeNewsList,
    List<NewsModel>? categoryNewsList,
    String? homeError,
    String? categoryError,
  }) {
    return NewsStates(
      homeStatus: homeStatus ?? this.homeStatus,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      homeNewsList: homeNewsList ?? this.homeNewsList,
      categoryNewsList: categoryNewsList ?? this.categoryNewsList,
      homeError: homeError ?? this.homeError,
      categoryError: categoryError ?? this.categoryError,
    );
  }
}
