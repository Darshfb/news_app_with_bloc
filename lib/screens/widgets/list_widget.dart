import 'package:flutter/material.dart';
import 'package:news_udemy_course/core/app_strings.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                  image: NetworkImage(
                    AppStrings.defaultImage,
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
              child: Text("Title ", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
            ),
          ),
        );
      },
    );
  }
}
