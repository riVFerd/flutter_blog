import 'package:flutter/material.dart';
import 'package:flutter_blog/logic/models/post_model.dart';
import 'package:flutter_blog/presentation/screens/home_screen.dart';
import 'package:flutter_blog/presentation/screens/post_detail_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/post_detail':
        final post = settings.arguments as PostModel;
        return MaterialPageRoute(builder: (_) => PostDetailScreen(post: post));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
