import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glasses/widgets/glass_container.dart';

void main() {
  testWidgets('GlassContainer renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlassContainer(
            width: 200,
            height: 200,
            borderRadius: 20,
            blur: 5,
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
            child: const Text('Glass'),
          ),
        ),
      ),
    );

    expect(find.text('Glass'), findsOneWidget);
  });
}
