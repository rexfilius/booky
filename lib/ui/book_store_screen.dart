import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/ui/compnents/book_store_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStoreScreen extends ConsumerWidget {
  const BookStoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bList = ref.watch(bookListProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: bList.when(
        data: (data) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 12.0,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: BookStoreItem(book: data[index]),
              );
            },
          );
        },
        error: (error, _) => const Center(child: Text('Hello')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
