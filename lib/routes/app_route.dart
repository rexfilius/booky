import 'package:booky/ui/book_detail_screen.dart';
import 'package:booky/ui/book_reader_screen.dart';
import 'package:booky/ui/book_store_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  static const bookStore = "/bookStore";
  static const bookDetail = "/bookDetail";
  static const bookReader = "/bookReader";
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoute.bookStore: (context) => const BookStoreScreen(),
  AppRoute.bookDetail: (context) => const BookDetailScreen(),
  AppRoute.bookReader: (context) => const BookReaderScreen(),
};
