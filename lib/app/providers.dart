import 'package:bookshelf/data/dao/book_dao.dart';
import 'package:bookshelf/data/database/database.dart';
import 'package:bookshelf/data/repositories/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/entities/book.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw Exception('Provider was not initialized. Override it in the main.');
});

final bookDaoProvider = Provider<BookDao>((ref) {
  return ref.watch(databaseProvider).bookDao;
});

final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return BookRepository(ref.watch(bookDaoProvider));
});

final booksListProvider = StreamProvider<List<Book>>((ref) {
  return ref.watch(bookRepositoryProvider).getAllBooks();
});

final bookByIdProvider = FutureProvider.family<Book?, int>((ref, id) {
  return ref.watch(bookRepositoryProvider).getBookById(id);
});