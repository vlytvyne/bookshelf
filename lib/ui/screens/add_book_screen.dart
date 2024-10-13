import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/data/enums/genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends ConsumerState<AddBookScreen> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _readingDateController = TextEditingController();

  DateTime? _selectedReadingDate;
  int _selectedRating = 0;
  Genre? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add book'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Gap(16),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const Gap(16),
                TextFormField(
                  controller: _authorController,
                  decoration: InputDecoration(
                    hintText: 'Author',
                  ),
                ),
                const Gap(16),
                DropdownMenu(
                  hintText: 'Genre',
                  width: double.infinity,
                  dropdownMenuEntries: Genre.values.map(
                    (e) => DropdownMenuEntry(value: e, label: e.displayName)
                  ).toList(),
                  onSelected: (genre) {
                    _selectedGenre = genre;
                  },
                ),
                const Gap(16),
                TextFormField(
                  controller: _readingDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Reading date',
                    prefixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () async {
                    final result = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
                    if (result != null) {
                      _selectedReadingDate = result;
                      _readingDateController.text = DateFormat.yMd().format(result);
                    }
                  },
                ),
                const Gap(16),
                Text('Rating'),
                RatingBar.builder(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  unratedColor: Colors.grey[300],
                  onRatingUpdate: (rating) {
                    _selectedRating = rating.toInt();
                  },
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                const Gap(40),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: FilledButton(
                    child: Text('Save'),
                    onPressed: _onSaveClick,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSaveClick() async {
    if (_titleController.text.isEmpty ||
        _authorController.text.isEmpty ||
        _readingDateController.text.isEmpty ||
        _selectedGenre == null ||
        _selectedRating == 0
    ) {
      const snackBar = SnackBar(
        content: Text('Please, fill in all necessary info.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final book = Book(
      title: _titleController.text,
      author: _authorController.text,
      genre: _selectedGenre!,
      readingDate: _selectedReadingDate!,
      rating: _selectedRating,
    );

    try {
      await ref.read(databaseProvider).bookDao.insertBook(book);
      Navigator.of(context).pop();
    } catch (e) {
      print('error');
    }
  }

}
