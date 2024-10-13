import 'package:bookshelf/data/entities/book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {

  @Query('SELECT * FROM Book')
  Stream<List<Book>> getAllBooks();

  @Query('SELECT * FROM Book WHERE id = :id')
  Future<Book?> getBookById(int id);

  @insert
  Future<void> insertBook(Book book);

  @delete
  Future<void> deleteBook(Book book);
}