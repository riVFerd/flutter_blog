import 'package:flutter/material.dart';
import 'package:flutter_blog/logic/models/post_model.dart';

import 'post_card.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: ListView.separated(
            itemCount: 5,
            itemBuilder: (context, index) => PostCard(
              post: PostModel(
                id: index,
                title:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                author: 'riVFerd',
                date: '${++index}/10/2023',
                imageUrl: 'https://source.unsplash.com/1080x720/?{news}',
              ),
            ),
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ),
      ],
    );
  }
}
