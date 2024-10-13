// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:bookshelf/data/dao/book_dao.dart';
import 'package:bookshelf/data/database/type_converters.dart';
import 'package:bookshelf/data/entities/book.dart';

part 'database.g.dart';

@TypeConverters([DateTimeConverter, GenreConverter])
@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
