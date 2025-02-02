import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/app/router.dart';
import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/ui/screens/add_book_screen.dart';
import 'package:bookshelf/ui/screens/book_details_screen.dart';
import 'package:bookshelf/ui/widgets/tiles/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LibraryScreen extends ConsumerWidget {

  static go(BuildContext context, String assignmentId) {
    context.go(Routes.library);
  }

  static push(BuildContext context, String assignmentId) {
    context.push(Routes.library);
  }

  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksListProvider);
    
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(books),
      floatingActionButton: _buildFab(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Library'),
    );
  }

  Widget _buildBody(AsyncValue<List<Book>> books) {
    return switch (books) {
      AsyncError(:final error) => Text('Error: $error'),
      AsyncData(:final value) => ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          return BookTile(
            value[index],
            onClick: () {
              BookDetailsScreen.push(context, value[index].id!);
            },
          );
        }
      ),
      _ => const CircularProgressIndicator(),
    };
  }

  FloatingActionButton _buildFab(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Add book'),
      icon: const Icon(Icons.add),
      onPressed: () {
        AddBookScreen.push(context);
      },
    );
  }

}
