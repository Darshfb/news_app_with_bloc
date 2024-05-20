import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_bloc.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/screens/widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        final news = context.watch<NewsBloc>().news;
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeErrorState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        }
        return NewsList(news: news,);
      },
    );
  }
}
