import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/cubit/theme_cubit.dart';
import 'package:flutter_blog/presentation/router/app_router.dart';
import 'package:flutter_blog/theme/theme_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
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
      ),
    );
  }
}
