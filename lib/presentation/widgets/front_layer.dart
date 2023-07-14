import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/bloc/posts_bloc.dart';
import 'package:flutter_blog/logic/models/post_model.dart';

import 'post_card.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostsBloc>();
    int currentPageIndex = 0;
    List<PostModel> posts = [];

    void fetchPostData() {
      postBloc.add(FetchPosts(pageIndex: currentPageIndex));
      currentPageIndex++;
    }

    if (postBloc.state is! PostsLoaded) fetchPostData();

    return Column(
      children: [
        Center(
          heightFactor: 2,
          child: Text(
            'Blog Posts',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoaded) {
                posts.addAll((postBloc.state as PostsLoaded).posts);

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: posts.length,
                        itemBuilder: (context, index) => PostCard(
                          post: PostModel(
                            title: posts[index].title,
                            author: posts[index].author,
                            date: posts[index].date,
                            imageUrl: posts[index].imageUrl,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ),
                    Visibility(
                      visible: !(postBloc.state as PostsLoaded).hasReachedMax,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () => fetchPostData(),
                        child: const Text('Load More'),
                      ),
                    ),
                  ],
                );
              } else if (state is PostsError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
