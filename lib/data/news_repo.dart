import 'package:dartz/dartz.dart';
import 'package:news_udemy_course/core/exception.dart';
import 'package:news_udemy_course/data/data_source/local_data_source.dart';
import 'package:news_udemy_course/data/data_source/remote_data_source.dart';
import 'package:news_udemy_course/data/news_model.dart';

class NewsRepo {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  NewsRepo(this._localDataSource, this._remoteDataSource);

  Future<Either<Failure, List<NewsModel>>> getHomeData({int? page}) async {
    try {
      final homeNews = await _localDataSource.getHomeNews();
      print("HomeNews => ${homeNews.length}");
      if (homeNews.isNotEmpty && page == 1) {
        return Right(homeNews);
      } else {
        final remoteHomeNews = await _remoteDataSource.getHomeData(page: page);
        if (page == 1) {
          _localDataSource.saveHomeNews(remoteHomeNews);
        }
        return Right(remoteHomeNews);
      }
    } on ServerException catch (e) {
      print("there is an erro here check it ${e.toString()}");
      return Left(ServerFailure(e.message.toString()));
    }
  }

  Future<Either<Failure, List<NewsModel>>> getCategoryData({
    required String category,
    int? page,
  }) async {
    try {
      final categoryNews = await _localDataSource.getCategoryNews(category);
      if (categoryNews.isNotEmpty && page == 1) {
        print("ThiscategoryNews from local ${categoryNews.length}");

        return Right(categoryNews);
      } else {
        print("PageNumber ${page}");

        final remoteCategoryNews = await _remoteDataSource.getCategoryData(
            page: page, category: category);
        if (page == 1) {
          _localDataSource.saveCategoryNews(remoteCategoryNews, category);
        }

        return Right(remoteCategoryNews);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
