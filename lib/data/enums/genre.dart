enum Genre {
  fiction('Fiction'),
  drama('Drama'),
  novel('Novel'),
  fantasy('Fantasy'),
  history('History'),
  humor('Humor'),
  classic('Classic'),
  memoir('Memoir');

  final String displayName;

  const Genre(this.displayName);
}