// Widget test dasar untuk aplikasi Angry Birds.
//
// Jalankan dengan: flutter test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_apps/main.dart';

void main() {
  testWidgets('App menampilkan judul Angry Birds', (WidgetTester tester) async {
    // Build app dan trigger satu frame.
    await tester.pumpWidget(const MyApp());

    // Judul di AppBar harus muncul.
    expect(find.text('Angry Birds'), findsWidgets);

    // Kolom pencarian harus ada.
    expect(find.byType(TextField), findsOneWidget);
  });
}