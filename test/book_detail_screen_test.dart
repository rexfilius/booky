// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:booky/data/models/book.dart';
import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/routes/app_route.dart';
import 'package:booky/ui/book_detail_screen.dart';
import 'package:booky/ui/book_reader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const dummyBook = Book(
  title: 'Test Title',
  author: 'Test Author',
  synopsis: 'Test Synopsis',
  id: 1,
  content: 'Test content',
  imageUrl: 'www.image.url',
  rating: '4.5',
);

final testBookProviderOverride = StateProvider<Book>((ref) => dummyBook);

void main() {
  testWidgets('Text widget displays "Author"', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          inMemoryBookProvider.overrideWithProvider(testBookProviderOverride),
        ],
        child: MaterialApp(
          routes: {
            AppRoute.bookDetail: (context) => const BookDetailScreen(),
            AppRoute.bookReader: (context) => const BookReaderScreen(),
          },
          initialRoute: AppRoute.bookDetail,
        ),
      ),
    );

    expect(find.text("Author"), findsOneWidget);
  });

  testWidgets('Navigation on "Read" button tap', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          inMemoryBookProvider.overrideWithProvider(testBookProviderOverride),
        ],
        child: MaterialApp(
          routes: {
            AppRoute.bookDetail: (context) => const BookDetailScreen(),
            AppRoute.bookReader: (context) => const BookReaderScreen(),
          },
          initialRoute: AppRoute.bookDetail,
        ),
      ),
    );

    final readButton = find.widgetWithText(OutlinedButton, 'Read');
    expect(readButton, findsOneWidget);
    await tester.tap(readButton);
    await tester.pumpAndSettle();

    expect(find.text(dummyBook.title), findsOneWidget);
  });
}
