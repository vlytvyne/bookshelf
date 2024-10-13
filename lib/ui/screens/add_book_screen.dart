import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add book'),
      ),
      body: Form(
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
                dropdownMenuEntries: [
                  DropdownMenuEntry(label: 'Genre 1', value: 'Genre 1'),
                  DropdownMenuEntry(label: 'Genre 2', value: 'Genre 2'),
                  DropdownMenuEntry(label: 'Genre 3', value: 'Genre 3'),
                ],
                onSelected: (item) {

                },
              ),
              const Gap(16),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
                },
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Reading date',
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
              const Gap(16),
              Text('Rating'),
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                unratedColor: Colors.grey[300],
                onRatingUpdate: (rating) {
                  print(rating);
                },
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              const Gap(16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
