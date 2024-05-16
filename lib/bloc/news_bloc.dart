import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/data/news_model.dart';
import 'package:news_udemy_course/data/news_repo.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  List<NewsModel> news = [];
  final NewsRepo _newsRepo;

  NewsBloc(this._newsRepo) : super(NewsInitialState()) {
    on<HomeEvent>((event, emit) async {
      // Loading state
      emit(HomeLoadingState());
      news = await _newsRepo.getHomeData();
      emit(HomeSuccessState());
      // // Loading state
      // emit(HomeLoadingState());
      // Dio dio = Dio();
      //
      // try {
      //   final response = await dio.get(
      //       "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c6863f9ec5e14cc399ce5d61ea3257fa");
      //   if (response.statusCode == 200) {
      //     news = response.data['articles']
      //         .map<NewsModel>((news) => NewsModel.fromJson(news))
      //         .toList();
      //     // Success
      //     emit(HomeSuccessState());
      //   }
      // } on DioException catch (error) {
      //   // Error
      //   emit(HomeErrorState(error: error.toString()));
      // }
    });
  }
}
