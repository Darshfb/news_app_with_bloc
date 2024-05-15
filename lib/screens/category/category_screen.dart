import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_udemy_course/core/category_list.dart';

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
    controller =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.purple,
          child: TabBar(
            isScrollable: false,
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            unselectedLabelStyle:
                TextStyle(fontSize: 13.0, color: Colors.black.withOpacity(.5)),
            labelStyle: const TextStyle(fontSize: 14.0, color: Colors.purple),
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
            controller: controller,
            children: CategoryList.categoryItems
                .map((category) => Text(category))
                .toList(),
          ),
        ),
      ],
    );
  }
}
