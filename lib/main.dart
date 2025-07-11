import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart';

void main() {
  runApp(const GlassifyExample());
}

class GlassifyExample extends StatelessWidget {
  const GlassifyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: GlassContainer(
            width: 300,
            height: 150,
            borderRadius: 20,
            blur: 10,
            border: 2,
            backgroundGradient: LinearGradient(
              colors: [Colors.white.withAlpha(51), Colors.blue.withAlpha(51)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: const LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            child: const Center(
              child: Text(
                'Glassify!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
