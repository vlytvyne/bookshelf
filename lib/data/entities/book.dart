import 'package:bookshelf/data/enums/genre.dart';
import 'package:floor/floor.dart';

@entity
class Book {

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String author;
  final Genre genre;
  final DateTime readingDate;
  final int rating;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.readingDate,
    required this.rating,
  });

}