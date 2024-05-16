abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class HomeSuccessState extends NewsStates {}

class HomeLoadingState extends NewsStates {}

class HomeErrorState extends NewsStates {
  final String error;

  HomeErrorState({required this.error});
}
