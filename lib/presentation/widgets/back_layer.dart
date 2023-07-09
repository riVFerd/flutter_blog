import 'package:flutter/material.dart';
import 'category_list.dart';

class BackLayer extends StatelessWidget {
  BackLayer({super.key});

  // dummy categories
  final categories = [
    'Music',
    'Nogizaka46',
    'Technology',
    'Education',
    'Movie & Series'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          title: Text('Home'),
        ),
        CategoryList(categories: categories),
      ],
    );
  }
}
