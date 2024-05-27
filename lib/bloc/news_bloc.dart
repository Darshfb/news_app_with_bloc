import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/data/news_model.dart';
import 'package:news_udemy_course/data/news_repo.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final NewsRepo _newsRepo;

  NewsBloc(this._newsRepo) : super(NewsStates()) {
    on<HomeEvent>((event, emit) async {
      // Loading state
      emit(state.copyWith(homeStatus: NewsStatus.loading));
      final response = await _newsRepo.getHomeData();
      response.fold(
          (left) => emit(state.copyWith(
                homeError: left.message,
                homeStatus: NewsStatus.error,
              )), (listOfNews) {
        emit(state.copyWith(
            homeNewsList: listOfNews, homeStatus: NewsStatus.success));
      });
    });

    on<CategoryEvent>((event, emit) async {
      // loading state
      emit(state.copyWith(categoryStatus: NewsStatus.loading));
      final success = await _newsRepo.getCategoryData(category: event.category);
      success.fold((l) {
        emit(state.copyWith(
            categoryError: l.message, categoryStatus: NewsStatus.error));
      }, (r) {
        emit(state.copyWith(
            categoryNewsList: r, categoryStatus: NewsStatus.success));
      });
    });
  }
}
