import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_udemy_course/bloc/news_bloc.dart';
import 'package:news_udemy_course/core/api_service/api_consumer.dart';
import 'package:news_udemy_course/core/api_service/dio_consumer.dart';
import 'package:news_udemy_course/data/data_source/local_data_source.dart';
import 'package:news_udemy_course/data/data_source/remote_data_source.dart';
import 'package:news_udemy_course/data/news_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => NewsRepo(sl(), sl()));
  sl.registerLazySingleton(() => NewsBloc(sl()));
    sl.registerLazySingleton(() => RemoteDataSource(sl()));
  sl.registerLazySingleton(() => LocalDataSource());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}
