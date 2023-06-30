import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('lib/assets/rivferd.png'),
              width: 48,
            ),
            Text(
              'riVFerd',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: state.themeMode == ThemeMode.dark,
                onChanged: (newValue) => context.read<ThemeCubit>().toggleTheme(),
              );
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
