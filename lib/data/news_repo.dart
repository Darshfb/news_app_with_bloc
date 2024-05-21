import 'package:dartz/dartz.dart';
import 'package:news_udemy_course/core/api_service/api_consts.dart';
import 'package:news_udemy_course/core/api_service/api_consumer.dart';
import 'package:news_udemy_course/core/exception.dart';
import 'package:news_udemy_course/data/news_model.dart';

class NewsRepo {
  final ApiConsumer _apiConsumer;

  NewsRepo(this._apiConsumer);

  Future<Either<Failure, List<NewsModel>>> getHomeData() async {
    try {
      final response = await _apiConsumer.get(
        ApiConstants.headlineEndPoint,
        queryParameters: ApiConstants.query(),
      );
      final List<NewsModel> news = response["articles"]
          .map<NewsModel>((article) => NewsModel.fromJson(article))
          .toList();
      return Right(news);
    } on ServerException catch (e) {
      print("there is an erro here check it ${e.toString()}");
      return Left(ServerFailure(e.message.toString()));
    }
  }

  Future<Either<Failure, List<NewsModel>>> getCategoryData(
      {required String category}) async {
    try {
      final response = await _apiConsumer.get(
        ApiConstants.headlineEndPoint,
        queryParameters: ApiConstants.query(category: category),
      );
      final List<NewsModel> news = response["articles"]
          .map<NewsModel>((article) => NewsModel.fromJson(article))
          .toList();
      return Right(news);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
