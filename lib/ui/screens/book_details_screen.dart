import 'package:bookshelf/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookDetailsScreen extends ConsumerWidget {

  final int id;

  const BookDetailsScreen(this.id, {super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text('Book details'),
      ),
      body: switch (book) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData(:final value) => value == null ? Text('None') :
          Column(
            children: [
              Text('Title'),
              Text(value.title),
              Text('Author'),
              Text(value.author),
              Text('Reading date'),
              Text(DateFormat.yMd().format(value.readingDate)),
              Text('Rating'),
              Text(value.rating.toString()),
            ],
          ),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
