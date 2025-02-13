import 'package:booky/data/models/book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

final inMemoryBookProvider = StateProvider<Book>((ref) {
  return const Book.empty();
});

final bookListProvider = FutureProvider<List<Book>>((ref) async {
  final String jsonString =
      await rootBundle.loadString('assets/json/bookJson.json');
  final List<dynamic> jsonData = json.decode(jsonString);
  return jsonData.map((json) => Book.fromJson(json)).toList();
});
