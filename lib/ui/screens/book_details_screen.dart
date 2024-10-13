import 'package:bookshelf/data/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookDetailsScreen extends StatelessWidget {

  final Book book;

  const BookDetailsScreen(this.book, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book details'),
      ),
      body: Column(
        children: [
          Text('Title'),
          Text(book.title),
          Text('Author'),
          Text(book.author),
          Text('Reading date'),
          Text(DateFormat.yMd().format(book.readingDate)),
          Text('Rating'),
          Text(book.rating.toString()),
        ],
      ),
    );
  }
}
