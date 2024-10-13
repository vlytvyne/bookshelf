import 'package:bookshelf/app/providers.dart';
import 'package:bookshelf/app/router.dart';
import 'package:bookshelf/data/entities/book.dart';
import 'package:bookshelf/data/enums/genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddBookScreen extends ConsumerStatefulWidget {

  static go(BuildContext context) {
    context.go(Routes.addBook);
  }

  static push(BuildContext context) {
    context.push(Routes.addBook);
  }

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
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Add book'),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(16),
              _buildTitleInputField(),
              const Gap(16),
              _buildAuthorInputField(),
              const Gap(16),
              _buildGenreDropdown(),
              const Gap(16),
              _buildDatePickerButton(context),
              const Gap(16),
              const Text('Rating'),
              _buildRatingBar(),
              const Gap(40),
              _buildSaveBtn(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTitleInputField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(
        hintText: 'Title',
      ),
    );
  }

  TextFormField _buildAuthorInputField() {
    return TextFormField(
      controller: _authorController,
      decoration: const InputDecoration(
        hintText: 'Author',
      ),
    );
  }

  DropdownMenu<Genre> _buildGenreDropdown() {
    return DropdownMenu(
      hintText: 'Genre',
      width: double.infinity,
      dropdownMenuEntries: Genre.values.map(
              (e) => DropdownMenuEntry(value: e, label: e.displayName)
      ).toList(),
      onSelected: (genre) {
        _selectedGenre = genre;
      },
    );
  }

  TextFormField _buildDatePickerButton(BuildContext context) {
    return TextFormField(
      controller: _readingDateController,
      readOnly: true,
      decoration: const InputDecoration(
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
    );
  }

  RatingBar _buildRatingBar() {
    return RatingBar.builder(
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
    );
  }

  SizedBox _buildSaveBtn() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: FilledButton(
        child: const Text('Save'),
        onPressed: _onSaveClick,
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
        content: Text('Please, fill in all the necessary data.'),
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
      context.pop();
    } catch (e) {
      print('error');
    }
  }

}
