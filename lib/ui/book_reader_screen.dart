import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/data/providers/book_reader_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReaderScreen extends ConsumerWidget {
  const BookReaderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookReader = ref.watch(bookReaderProvider);
    final book = ref.watch(inMemoryBookProvider);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Card(
            elevation: 0.0,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () =>
                        ref.read(bookReaderProvider.notifier).stopReading(),
                    icon: const Icon(Icons.stop),
                  ),
                  const SizedBox(width: 16.0),
                  IconButton.filled(
                    onPressed: () =>
                        ref.read(bookReaderProvider.notifier).read(),
                    icon: Icon(
                      bookReader.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    book.content,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
