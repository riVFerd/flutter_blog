import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/bloc/posts_bloc.dart';
import 'package:flutter_blog/logic/models/category_model.dart';

import 'post_card.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostsBloc>();

    void fetchPostData(int pageIndex) => postBloc.add(FetchPosts(pageIndex));

    if (postBloc.state is! PostsLoaded) fetchPostData(0);

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
                final posts = state.posts;
                if (posts.isEmpty) {
                  return Column(
                    children: [
                      _CategoryChip(category: state.category),
                      Expanded(
                        child: Center(
                          child: Text(
                            'No Posts Found',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    _CategoryChip(category: state.category),
                    Expanded(
                      child: ListView.separated(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return PostCard(post: posts[index]);
                        },
                        padding: const EdgeInsets.all(8),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ),
                    Visibility(
                      visible: !state.hasReachedMax,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () =>
                            fetchPostData(state.currentPageIndex + 1),
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

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({this.category});

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: category != null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Showing content in category :',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Chip(
            onDeleted: () =>
                BlocProvider.of<PostsBloc>(context).add(ResetPosts()),
            label: Text(
              '${category?.categoryName}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
