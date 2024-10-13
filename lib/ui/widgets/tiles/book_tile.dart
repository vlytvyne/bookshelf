import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/ui/styles/one_line_text_style.dart';
import 'package:bookshelf/ui/widgets/other/static_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class BookTile extends StatelessWidget {

  final Book book;
  final VoidCallback? onClick;

  const BookTile(this.book, {super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          const Gap(16),
          _buildIcon(),
          const Gap(16),
          _buildContent(),
          const Gap(16),
          const Spacer(),
          StaticRating(book.rating),
          const Gap(16),
        ],
      ),
    );
  }

  Icon _buildIcon() {
    return const Icon(
      Icons.book,
      size: 40,
      color: Colors.purple,
    );
  }

  Expanded _buildContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(8),
          Text(
            book.title,
            style: ts.size18.semibold,
          ),
          Text(
            book.author,
          ),
          Text(
            DateFormat.yMd().format(book.readingDate),
            style: ts.size12.grey,
          ),
          const Gap(8),
        ],
      ),
    );
  }

}
