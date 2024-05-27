import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/core/cache_data.dart';
import 'package:news_udemy_course/data/news_model.dart';

class LocalDataSource {
  // List<NewsModel>

// Cached our data
  Future<void> saveHomeNews(List<NewsModel> news) async {
    List home = news
        .map<Map<String, dynamic>>((homeNews) => homeNews.toJson())
        .toList();
    await SharedData.saveData(
        key: AppStrings.cacheHome, value: jsonEncode(home));
  }

  // Get Our home Data
  Future<List<NewsModel>> getHomeNews() async {
    debugPrint("Get data from local data source");
    final homeNews = await SharedData.getData(key: AppStrings.cacheHome);
    if (homeNews != null) {
      List<NewsModel> list = (jsonDecode(homeNews) as List)
          .map((home) => NewsModel.fromJson(home))
          .toList();
      return Future.value(list);
    } else {
      return [];
    }
  }

  // Cached our data
  Future<void> saveCategoryNews(List<NewsModel> categoryNews, String category) async {
    List home = categoryNews
        .map<Map<String, dynamic>>((category) => category.toJson())
        .toList();
    await SharedData.saveData(
        key: category, value: jsonEncode(home));
  }

  // Get Our home Data
  Future<List<NewsModel>> getCategoryNews(String category) async {
    final categoryNews =
        await SharedData.getData(key: category);
    if (categoryNews != null) {
      List<NewsModel> list = (jsonDecode(categoryNews) as List)
          .map((home) => NewsModel.fromJson(home))
          .toList();
      return Future.value(list);
    } else {
      return [];
    }
  }
}
