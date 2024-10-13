import 'package:bookshelf/data/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw Exception('Provider was not initialized. Override it in the main.');
});