import 'package:flutter/material.dart';
import 'package:news_udemy_course/data/news_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.news});
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: news.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
                        "${news[index].urlToImage}",
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
                    "${news[index].title}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
        MaterialButton(
          color: Colors.teal,
          minWidth: double.infinity,
          onPressed: () {},
          child: const Text("Load more"),
        )
      ],
    );
  }
}
