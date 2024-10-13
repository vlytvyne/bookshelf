import 'dart:math';

import 'package:floor/floor.dart';

@entity
class Book {

  @primaryKey
  final int id;

  final String title;
  final String author;
  final String genre;
  final DateTime readingDate;
  final int rating;

  Book(this.id, this.title, this.author, this.genre, this.readingDate, this.rating);

}