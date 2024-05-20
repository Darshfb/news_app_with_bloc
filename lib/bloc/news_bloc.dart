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
    });

    on<CategoryEvent>((event, emit) async {
      // loading state
      emit(CategoryLoadingState());
      final success = await _newsRepo.getCategoryData(category: event.category);
      emit(CategorySucessState(news: success));
    });
  }
}
