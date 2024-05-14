import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/core/cache_data.dart';
import 'package:news_udemy_course/home_layout/home_layout.dart';
import 'package:news_udemy_course/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_udemy_course/home_layout/home_layout_cubit/home_layout_states.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              home: const HomeLayout());
        },
      ),
    );
  }
}
