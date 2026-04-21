import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: InkWell(
        onTap: () => print("PRESSED"),
        child: Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child: Text('Hello there', style: theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
