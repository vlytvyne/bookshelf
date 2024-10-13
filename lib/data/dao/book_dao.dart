import 'package:bookshelf/data/entities/book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {

  @Query('SELECT * FROM Book')
  Future<List<Book>> getAllBooks();

  @insert
  Future<void> insertBook(Book book);
}