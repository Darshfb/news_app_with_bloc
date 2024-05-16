import 'package:flutter/material.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_) => HomeLayout());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("${AppStrings.noRoutes} ${settings.name}"),
                  ),
                ));
    }
  }
}
