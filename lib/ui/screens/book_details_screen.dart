import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/ui/styles/one_line_text_style.dart';
import 'package:bookshelf/ui/widgets/other/static_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class BookDetailsScreen extends ConsumerWidget {

  final int id;

  const BookDetailsScreen(this.id, {super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider(id));

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(book),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Book details'),
    );
  }

  Widget _buildBody(AsyncValue<Book?> book) {
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
