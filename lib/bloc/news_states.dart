import 'package:news_udemy_course/data/news_model.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class HomeSuccessState extends NewsStates {}

class HomeLoadingState extends NewsStates {}

class HomeErrorState extends NewsStates {
  final String error;

  HomeErrorState({required this.error});
}

class CategorySucessState extends NewsStates {
  List<NewsModel> news = [];
  CategorySucessState({required this.news});
}

class CategoryErrorState extends NewsStates {
  final String error;
  CategoryErrorState({required this.error});
}

class CategoryLoadingState extends NewsStates {}
