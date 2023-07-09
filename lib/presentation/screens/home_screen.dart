import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/logic/cubit/theme_cubit.dart';

import '../widgets/back_layer.dart';
import '../widgets/front_layer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      stickyFrontLayer: true,
      appBar: BackdropAppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
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
              return IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                icon: Icon(
                  state.themeMode == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              );
            },
          ),
          BackdropToggleButton(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
      backLayer: BackLayer(),
      frontLayer: const FrontLayer(),
    );
  }
}
