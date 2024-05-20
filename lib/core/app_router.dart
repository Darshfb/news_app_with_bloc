import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/di.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (BuildContext context) => sl<NewsBloc>()..add(HomeEvent()),
            child:  HomeLayout()));
      default:
        return MaterialPageRoute(
            builder: (_) =>  Scaffold(
                  body: Center(
                    child: Text("${AppStrings.noRoutes} ${settings.name}"),
                  ),
                ));
    }
  }
}
