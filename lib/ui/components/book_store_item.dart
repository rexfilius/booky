import 'dart:math';

import 'package:booky/data/models/book.dart';
import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStoreItem extends ConsumerWidget {
  const BookStoreItem({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(inMemoryBookProvider.notifier).state = book;
        Navigator.of(context).pushNamed(AppRoute.bookDetail);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                images[randomNumber()],
              ),
            ),
            Flexible(
              child: Text(
                book.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Flexible(
              child: Text(
                book.author,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text("Rating: ${book.rating}")
          ],
        ),
      ),
    );
  }
}

List<String> images = [
  "assets/image/img1.jpg",
  "assets/image/img2.jpg",
  "assets/image/img3.jpg",
  "assets/image/img4.jpg",
];

int randomNumber() {
  Random random = Random();
  return random.nextInt(4);
}
