import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/ui/screens/add_book_screen.dart';
import 'package:bookshelf/ui/screens/book_details_screen.dart';
import 'package:bookshelf/ui/widgets/tiles/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final books = [
  // Book(
  //   1,
  //   'Title 1',
  //   'Author 1',
  //   'Genre 1',
  //   DateTime.now(),
  //   3,
  // ),
  // Book(
  //   2,
  //   'Title 2',
  //   'Author 2',
  //   'Genre 2',
  //   DateTime.now(),
  //   3,
  // ),
  // Book(
  //   3,
  //   'Title 3',
  //   'Author 3',
  //   'Genre 3',
  //   DateTime.now(),
  //   3,
  // ),
];

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksList);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: switch (books) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData(:final value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return BookTile(
              value[index],
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return BookDetailsScreen(value[index]);
                }));
              },
            );
          }
        ),
        _ => const CircularProgressIndicator(),
      },
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add book'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddBookScreen();
          }));
        },
      ),
    );
  }
}
