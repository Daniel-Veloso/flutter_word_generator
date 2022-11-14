import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Generator'),
      ),
      body: Container(
        child: Center(
          child: Text('Random advice'),
        ),
      ),
    );
  }
}
