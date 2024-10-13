enum Genre {
  fiction('Fiction'),
  drama('Drama'),
  novel('Novel'),
  fantasy('Fantasy'),
  history('History'),
  humor('Humor'),
  classic('Classic'),
  memoir('Memoir');

  /// Better to have it outside of the enum
  final String displayName;

  const Genre(this.displayName);
}