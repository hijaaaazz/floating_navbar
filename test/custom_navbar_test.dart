import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../lib /custom_navbar.dart';

void main() {
  testWidgets('CustomNavBar renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              FloatingNavBar(
            initialIndex: 0,
            icons: [Icon(Icons.home), Icon(Icons.search), Icon(Icons.person)],
            onTap: (index) {},
          ),
            ],
          ),
         
        ),
      ),
    );

    expect(find.byType(FloatingNavBar), findsOneWidget);
  });
}
