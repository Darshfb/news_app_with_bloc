import 'package:news_udemy_course/core/api_service/api_consts.dart';
import 'package:news_udemy_course/core/api_service/api_consumer.dart';
import 'package:news_udemy_course/data/news_model.dart';

class NewsRepo {
  final ApiConsumer _apiConsumer;

  NewsRepo(this._apiConsumer);

  Future<List<NewsModel>> getHomeData() async {
    final response = await _apiConsumer.get(
      ApiConstants.headlineEndPoint,
      queryParameters: ApiConstants.query,
    );
    final List<NewsModel> news = response["articles"]
        .map<NewsModel>((article) => NewsModel.fromJson(article))
        .toList();
    return news;
  }

}
