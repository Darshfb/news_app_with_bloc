import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/core/app_strings.dart';
import 'package:news_udemy_course/core/cache_data.dart';
import 'package:news_udemy_course/core/category_list.dart';
import 'package:news_udemy_course/screens/widgets/list_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: CategoryList.categoryItems.length, vsync: this);

      BlocProvider.of<NewsBloc>(context).add(CategoryEvent(category: CategoryList.categoryItems[0]));

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            onTap: (int index) {
              BlocProvider.of<NewsBloc>(context).add(
                  CategoryEvent(category: CategoryList.categoryItems[index]));
              BlocProvider.of<NewsBloc>(context).state.categoryNewsList.clear();
              BlocProvider.of<NewsBloc>(context).categoryPage = 1;
            },
            unselectedLabelStyle:
                TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(.5)),
            labelStyle: const TextStyle(
              fontSize: 13.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            labelColor: Colors.white,
            tabs: CategoryList.categoryItems
                .map((category) => Tab(
                      text: category,
                    ))
                .toList(),
            labelPadding: const EdgeInsets.symmetric(horizontal: 3),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: CategoryList.categoryItems.map(
              (category) {
                return BlocBuilder<NewsBloc, NewsStates>(
                    builder: (context, state) {
                  if (state.categoryStatus == NewsStatus.loading &&
                      state.categoryNewsList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.homeStatus == NewsStatus.error) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          state.categoryError,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    );
                  } else {
                    return NewsList(
                      news: state.categoryNewsList,
                      loadMore: () {
                        BlocProvider.of<NewsBloc>(context)
                            .add(CategoryEvent(category: category));
                      },
                    );
                  }
                });
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
