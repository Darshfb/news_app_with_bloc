import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/core/cache_data.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout_cubit/home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

// the first time the app will launch it will be light mode

/*
is Dark the default value is false
casue the cashed variable = null
*/
  bool isDark = SharedData.getData(key: AppStrings.appTheme) ?? false;

  // we will toggle our theme mode from light to dark mode
  // To toggle between two values of boolens we will use exclamation mark "!"
  void changeThemeMode() {
    isDark = !isDark;
    debugPrint(isDark.toString());
    SharedData.saveData(key: AppStrings.appTheme, value: isDark);
    emit(ChangeThemeModeState());
  }
}
