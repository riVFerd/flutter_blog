import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/bloc/categories_bloc.dart';
import 'package:flutter_blog/logic/bloc/posts_bloc.dart';
import 'package:flutter_blog/logic/bloc/theme_bloc.dart';
import 'package:flutter_blog/presentation/router/app_router.dart';
import 'package:flutter_blog/theme/theme_constants.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => CategoriesBloc()),
        BlocProvider(create: (context) => PostsBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {
        context.read<PostsBloc>().add(
              RefreshPosts(
                posts: (context.read<PostsBloc>().state as PostsLoaded).posts,
              ),
            );
      },
      builder: (context, state) {
        return MaterialApp(
          title: 'riVFerd',
          themeMode: state.themeMode,
          theme: ThemeConstants.lightThemeData,
          darkTheme: ThemeConstants.darkThemeData,
          onGenerateRoute: AppRouter().onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
