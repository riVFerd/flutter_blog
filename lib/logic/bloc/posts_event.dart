part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {}

class FetchPosts extends PostsEvent {
  final int pageIndex;

  FetchPosts({required this.pageIndex});
  
  @override
  List<Object?> get props => [pageIndex];
}

class RefreshPosts extends PostsEvent {
  final List<PostModel> posts;

  RefreshPosts({required this.posts});

  @override
  List<Object?> get props => [posts];
}
