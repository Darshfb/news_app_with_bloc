import 'package:news_udemy_course/core/api_service/api_consts.dart';
import 'package:news_udemy_course/core/api_service/api_consumer.dart';
import 'package:news_udemy_course/core/exception.dart';
import 'package:news_udemy_course/data/news_model.dart';

class RemoteDataSource {
  final ApiConsumer _apiConsumer;

  RemoteDataSource(this._apiConsumer);

  Future<List<NewsModel>> getHomeData({int? page}) async {
    try {
      final response = await _apiConsumer.get(
        ApiConstants.headlineEndPoint,
        queryParameters: ApiConstants.query(page: page ?? 1),
      );
      final List<NewsModel> news = response["articles"]
        .map<NewsModel>((article) => NewsModel.fromJson(article)).toList();
      return news;
    } on ServerException catch (e) {
      print("there is an erro here check it ${e.toString()}");
      throw ServerException(e.message);
    }
  }

  Future<List<NewsModel>> getCategoryData({
    required String category,
    int? page,
  }) async {
    try {
      final response = await _apiConsumer.get(
        ApiConstants.headlineEndPoint,
        queryParameters: ApiConstants.query(
          category: category,
          page: page ?? 1,
        ),
      );
      final List<NewsModel> news = response["articles"]
          .map<NewsModel>((article) => NewsModel.fromJson(article))
          .toList();
      return news;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
