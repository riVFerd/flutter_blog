part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class FetchPosts extends PostsEvent {
  final int pageIndex;

  FetchPosts({required this.pageIndex});
}
