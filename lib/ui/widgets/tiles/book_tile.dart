import 'package:bookshelf/data/entities/book.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {

  final Book book;

  const BookTile(this.book, {super.key,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
    );
  }
}
