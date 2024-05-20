abstract class NewsEvents {}

class HomeEvent extends NewsEvents {}

class CategoryEvent extends NewsEvents {
  final String category;
  CategoryEvent({required this.category});
}
