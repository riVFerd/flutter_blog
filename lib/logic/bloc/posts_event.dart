part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {}

class ResetPosts extends PostsEvent {
  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostsEvent {
  final int pageIndex;

  FetchPosts(this.pageIndex);
  
  @override
  List<Object?> get props => [pageIndex];
}

class FetchPostsByCategory extends PostsEvent {
  final CategoryModel category;

  FetchPostsByCategory(this.category);
  
  @override
  List<Object?> get props => [category];
}