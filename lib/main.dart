import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_udemy_course/core/app_router.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/core/bloc_observer.dart';
import 'package:news_udemy_course/core/cache_data.dart';
import 'package:news_udemy_course/di.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout_cubit/home_layout_states.dart';

void main() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    FlutterNativeSplash.remove();

  await SharedData.init();
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(MyApp());
    FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: context.read<HomeLayoutCubit>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: AppStrings.layout,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
