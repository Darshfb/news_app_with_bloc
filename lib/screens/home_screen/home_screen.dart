import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_udemy_course/bloc/news_bloc.dart';
import 'package:news_udemy_course/bloc/news_events.dart';
import 'package:news_udemy_course/bloc/news_states.dart';
import 'package:news_udemy_course/screens/widgets/list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      buildWhen: ((previous, current) => previous != current),
      builder: (context, state) {
       
        if (state.homeStatus == NewsStatus.loading &&
            state.homeNewsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.homeStatus == NewsStatus.error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                state.homeError,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        }
        return NewsList(
                  news: state.homeNewsList,
                  loadMore: () {
        BlocProvider.of<NewsBloc>(context).add(HomeEvent());
                  },
                );
      },
    );
  }
}
