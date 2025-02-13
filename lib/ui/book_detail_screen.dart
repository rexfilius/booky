import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/routes/app_route.dart';
import 'package:booky/ui/components/book_store_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetailScreen extends ConsumerWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(inMemoryBookProvider);
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        children: [
          SizedBox(
            height: 250,
            child: Image.asset(
              images[randomNumber()],
            ),
          ),
          const Text(
            "Author",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(book.author),
          const SizedBox(height: 12.0),
          const Text(
            "Synopsis",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(book.synopsis),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: const Text("Uavailable"),
                        content: const Text("No purchase yet"),
                        actions: [
                          TextButton(
                            child: const Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Purchase'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoute.bookReader);
                },
                child: const Text('Read'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
