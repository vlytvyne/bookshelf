import 'package:bookshelf/data/dao/book_dao.dart';
import 'package:bookshelf/data/entities/book.dart';

class BookRepository {

  final BookDao dao;

  BookRepository(this.dao);

  Stream<List<Book>> getAllBooks() {
    return dao.getAllBooks();
  }

  Future<Book?> getBookById(int id) {
    return dao.getBookById(id);
  }

  Future<void> insertBook(Book book) {
    return dao.insertBook(book);
  }

  Future<void> deleteBook(Book book) {
    return dao.deleteBook(book);
  }

}