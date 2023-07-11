import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/bloc/categories_bloc.dart';

import 'category_list.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({super.key});

  @override
  Widget build(BuildContext context) {
    // make below code to only run once (when the state of CategoriesBloc is not CategoriesLoaded)
    if (context.read<CategoriesBloc>().state is! CategoriesLoaded) context.read<CategoriesBloc>().add(FetchCategories());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          title: Text('Home'),
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return CategoryList(categories: state.categories);
            } else if (state is CategoriesError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
