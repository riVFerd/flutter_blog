import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/bloc/posts_bloc.dart';
import 'package:flutter_blog/logic/models/post_model.dart';

import 'post_card.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPageIndex = 0;
    if (context.read<PostsBloc>().state is! PostsLoaded) {
      context.read<PostsBloc>().add(FetchPosts(pageIndex: currentPageIndex));
    }

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
                return ListView.separated(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) => PostCard(
                    post: PostModel(
                      title: state.posts[index].title,
                      author: state.posts[index].author,
                      date: state.posts[index].date,
                      imageUrl: state.posts[index].imageUrl,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
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
