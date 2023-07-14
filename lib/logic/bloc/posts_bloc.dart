import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/logic/models/post_model.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await PostModel.getPosts(event.pageIndex);
        if (posts.isEmpty) {
          emit(PostsLoaded(posts: posts, hasReachedMax: true));
        } else {
          emit(PostsLoaded(posts: posts));
        }
      } catch (e) {
        emit(PostsError(message: 'Error fetching posts'));
      }
    });
    on<RefreshPosts>((event, emit) {
      emit(PostsLoaded(posts: event.posts));
    });
  }
}
