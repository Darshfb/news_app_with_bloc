import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/screens/category/category_screen.dart';
import 'package:news_udemy_course/screens/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:news_udemy_course/screens/home_screen/home_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print("Hello mostafa mahmoud 2 ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<HomeLayoutCubit>(context).changeThemeMode();
              },
              icon: Icon(context.read<HomeLayoutCubit>().isDark
                  ? Icons.dark_mode
                  : Icons.light_mode)),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
        },
        controller: pageController,
        children: const [
          HomeScreen(),
          CategoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.read<HomeLayoutCubit>().currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          context.read<HomeLayoutCubit>().changeNavBar(index: index);
          pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
            tooltip: AppStrings.home,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: AppStrings.category,
            tooltip: AppStrings.category,
            activeIcon: Icon(Icons.category_outlined),
          ),
        ],
      ),
    );
  }
}
