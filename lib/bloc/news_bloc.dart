import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/data/news_repo.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final NewsRepo _newsRepo;
  int page = 1;
  int categoryPage = 1;
  NewsBloc(this._newsRepo) : super(NewsStates()) {
    on<HomeEvent>((event, emit) async {
      // Loading state
      emit(state.copyWith(homeStatus: NewsStatus.loading));
      final response = await _newsRepo.getHomeData(page: page++);
      response.fold(
          (left) => emit(state.copyWith(
                homeError: left.message,
                homeStatus: NewsStatus.error,
              )), (homeNews) {
        // state .homeNews is []
        // [] => homeNews
        // homeNews will add another of homeNews list from the next page
        homeNews.isEmpty
            ? emit(state.copyWith(homeStatus: NewsStatus.success))
            : emit(state.copyWith(
                homeNewsList: List.of(state.homeNewsList)..addAll(homeNews),
                homeStatus: NewsStatus.success,
              ));
      });
    });

    on<CategoryEvent>((event, emit) async {
      // loading state
      emit(state.copyWith(categoryStatus: NewsStatus.loading));
      final success =
          await _newsRepo.getCategoryData(category: event.category, page: categoryPage);
      success.fold((l) {
        emit(state.copyWith(
            categoryError: l.message, categoryStatus: NewsStatus.error));
      }, (categoryNews) {
        categoryNews.isEmpty
            ? emit(state.copyWith(categoryStatus: NewsStatus.success))
            : emit(state.copyWith(
                categoryNewsList: List.of(state.categoryNewsList)
                  ..addAll(categoryNews),
                categoryStatus: NewsStatus.success,
              ));
      });
    });
  }
}
