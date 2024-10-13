import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/ui/screens/add_book_screen.dart';
import 'package:bookshelf/ui/screens/book_details_screen.dart';
import 'package:bookshelf/ui/widgets/tiles/book_tile.dart';
import 'package:flutter/material.dart';

final books = [
  Book(
    1,
    'Title 1',
    'Author 1',
    'Genre 1',
    DateTime.now(),
    3,
  ),
  Book(
    2,
    'Title 2',
    'Author 2',
    'Genre 2',
    DateTime.now(),
    3,
  ),
  Book(
    3,
    'Title 3',
    'Author 3',
    'Genre 3',
    DateTime.now(),
    3,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookTile(
            books[index],
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BookDetailsScreen(books[index]);
              }));
            },
          );
        }
      ),
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
