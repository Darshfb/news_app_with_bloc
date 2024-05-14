import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/core/extension.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_udemy_course/screens/second_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        actions: [
          IconButton(onPressed: (){
            BlocProvider.of<HomeLayoutCubit>(context).changeThemeMode();
          }, icon:  Icon(context.read<HomeLayoutCubit>().isDark ?
           Icons.dark_mode: 
           Icons.light_mode)),
          IconButton(onPressed: (){
            //Navigator.pushNamed(context, AppStrings.secondScreen);
           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondScreen()));
            //context.pushNamed(routeName: AppStrings.secondScreen);
          }, icon: const Icon(Icons.navigate_next)),
        
        ],
      ),
      body: Center(
        child: Text("Home Screen", style: Theme.of(context).textTheme.displayLarge,),
      ),
    );
  }
}