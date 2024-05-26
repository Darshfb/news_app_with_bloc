import 'package:flutter/material.dart';
import 'package:news_udemy_course/data/news_model.dart';

class NewsList extends StatefulWidget {
  NewsList({
    super.key,
    required this.news,
    required this.loadMore,
  });
  final List<NewsModel> news;
  final Function() loadMore;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final controller = ScrollController();

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print("the last position of screen");
      widget.loadMore();
    } else {
      print("It's not the last position");
    }
  }

  @override
  void initState() {
    print("hellowworld");
    controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: widget.news.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(
                    "${widget.news[index].urlToImage}",
                  ),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
              child: Text(
                "${widget.news[index].title}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
