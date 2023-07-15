part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {}

class FetchPosts extends PostsEvent {
  final int pageIndex;

  FetchPosts(this.pageIndex);
  
  @override
  List<Object?> get props => [pageIndex];
}
