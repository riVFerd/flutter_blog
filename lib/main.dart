import 'package:flutter/material.dart';
import 'package:flutter_blog/presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'riVFerd',
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}