import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/app/router.dart';
import 'package:bookshelf/ui/styles/one_line_text_style.dart';
import 'package:bookshelf/ui/widgets/other/static_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookDetailsScreen extends ConsumerWidget {

  static go(BuildContext context, int bookId) {
    context.go(Routes.bookDetails.replaceFirst(':id', bookId.toString()));
  }

  static push(BuildContext context, int bookId) {
    context.push(Routes.bookDetails.replaceFirst(':id', bookId.toString()));
  }

  final int id;

  const BookDetailsScreen(this.id, {super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: _buildBody(context, ref),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider(id));

    return AppBar(
      title: const Text('Book details'),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            try {
              if (book.hasValue && book.value != null) {
                await ref.read(databaseProvider).bookDao.deleteBook(book.value!);
                context.pop();
              }
            } catch (e) {
              print('error');
            }
          }
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider(id));

    return switch (book) {
      AsyncError(:final error) => Text('Error: $error'),
      AsyncData(:final value) => value == null ? const Text('None') :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StaticRating(value.rating, size: 40,),
                const Gap(8),
                _buildKeyValueToken(
                  'Title',
                  value.title,
                ),
                const Gap(8),
                _buildKeyValueToken(
                  'Author',
                  value.author,
                ),
                const Gap(8),
                _buildKeyValueToken(
                  'Reading date',
                  DateFormat.yMd().format(value.readingDate),
                ),
              ],
            ),
          ),
        ),
      _ => const CircularProgressIndicator(),
    };
  }

  Widget _buildKeyValueToken(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: ts.size16,
        ),
        Text(
          value,
          style: ts.size20.semibold,
        ),
      ],
    );
  }

}
