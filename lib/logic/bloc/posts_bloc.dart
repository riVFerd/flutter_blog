import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/models/category_model.dart';
import 'package:flutter_blog/logic/models/post_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      List<PostModel> currentPosts = [...state.posts];
      CategoryModel? currentCategory = state.category;
      emit(const PostsLoading());
      try {
        final pageIndex = event.pageIndex;
        final newPosts = await PostModel.getPosts(
          pageIndex,
          categorySlug: currentCategory?.categorySlug,
        );
        currentPosts.addAll(newPosts);
        if (newPosts.isEmpty) {
          emit(PostsLoaded(
            posts: currentPosts,
            hasReachedMax: true,
            currentPageIndex: pageIndex,
            category: currentCategory,
          ));
        } else {
          emit(PostsLoaded(
            posts: currentPosts,
            currentPageIndex: pageIndex,
            category: currentCategory,
          ));
        }
      } catch (e) {
        emit(PostsError(message: e.toString()));
      }
    });
    on<FetchPostsByCategory>((event, emit) {
      emit(PostsLoading(category: event.category));
      add(FetchPosts(0));
    });
    on<ResetPosts>((event, emit) {
      emit(PostsInitial());
      add(FetchPosts(0));
    });
  }
}
