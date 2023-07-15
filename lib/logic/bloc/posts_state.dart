part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {
  final List<PostModel> posts;
  final bool hasReachedMax;
  final int currentPageIndex;

  const PostsState({
    this.posts = const [],
    this.hasReachedMax = false,
    this.currentPageIndex = 0,
  });

  @override
  List<Object?> get props => [posts, hasReachedMax, currentPageIndex];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  const PostsLoaded({
    required List<PostModel> posts,
    bool hasReachedMax = false,
    required currentPageIndex,
  }) : super(
          posts: posts,
          hasReachedMax: hasReachedMax,
          currentPageIndex: currentPageIndex,
        );
}

class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});
}
