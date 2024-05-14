import 'package:flutter/material.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout.dart';
import 'package:news_udemy_course/screens/second_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.layout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
        case AppStrings.secondScreen:
        return MaterialPageRoute(builder: (_) => const SecondScreen());
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
