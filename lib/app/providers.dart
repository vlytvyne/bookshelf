import 'package:bookshelf/data/dao/book_dao.dart';
import 'package:bookshelf/data/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/entities/book.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw Exception('Provider was not initialized. Override it in the main.');
});

final bookDaoProvider = Provider<BookDao>((ref) {
  return ref.watch(databaseProvider).bookDao;
});

final booksListProvider = StreamProvider<List<Book>>((ref) {
  return ref.watch(bookDaoProvider).getAllBooks();
});

final bookProvider = FutureProvider.family<Book?, int>((ref, id) {
  return ref.watch(bookDaoProvider).getBookById(id);
});