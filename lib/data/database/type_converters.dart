import 'package:bookshelf/data/enums/genre.dart';
import 'package:floor/floor.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}


class GenreConverter extends TypeConverter<Genre, String> {
  @override
  Genre decode(String databaseValue) {
    return Genre.values.byName(databaseValue);
  }

  @override
  String encode(Genre value) {
    return value.toString().split('.').last;
  }
}