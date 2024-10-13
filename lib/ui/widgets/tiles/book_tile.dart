import 'package:bookshelf/data/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookTile extends StatelessWidget {

  final Book book;
  final VoidCallback? onClick;

  const BookTile(this.book, {super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(
        book.author
        + '\n' +
        DateFormat.yMd().format(book.readingDate),
      ),
      isThreeLine: true,
      onTap: onClick,
    );
  }
}
