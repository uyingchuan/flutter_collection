import 'package:flutter/material.dart';
import 'package:flutter_collection/flutter_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Measurable Widget', (widgetTester) async {
    Size? size;
    await widgetTester.pumpWidget(MaterialApp(
      title: 'Test Measurable Widget',
      home: Scaffold(
        body: Center(
          child: Measurable(
            onChange: (value) {
              size = value;
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text('Test', textDirection: TextDirection.ltr),
            ),
          ),
        ),
      ),
    ));
    final widgetFinder = find.text('Test');
    expect(widgetFinder, findsOneWidget);
    expect(size, const Size(100, 100));
  });
}
