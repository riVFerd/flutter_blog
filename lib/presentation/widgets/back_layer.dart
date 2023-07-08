import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Back Layer'),
      ),
    );
  }
}