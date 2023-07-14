part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {}

class PostsInitial extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostsLoading extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostsLoaded extends PostsState {
  final List<PostModel> posts;
  final bool hasReachedMax;

  PostsLoaded({required this.posts, this.hasReachedMax = false});

  @override
  List<Object?> get props => [posts, hasReachedMax];
}

class PostsError extends PostsState {
  final String message;

  PostsError({required this.message});

  @override
  List<Object?> get props => [message];
}
