class Movie {
  String name = "";
  String genre = "";
  int year = 0;
  bool watched = false;

  Movie({
    required this.name,
    required this.genre,
    required this.year,
    this.watched = false,
  });

  void setName(String name) {
    this.name = name;
  }

  void setGenre(String genre) {
    this.genre = genre;
  }

  void setYear(int year) {
    this.year = year;
  }

  void setWatched(bool watched) {
    this.watched = watched;
  }

  String getName() {
    return name;
  }

  String getGenre() {
    return genre;
  }

  int getYear() {
    return year;
  }

  bool getWatched() {
    return watched;
  }

  @override
  String toString() {
    return name;
  }
}

class Movie2 {
  // An example.
  static final lordOfTheRings = Movie2(
    name: 'Lord of the Rings',
    genre: 'Fanntasy',
    year: 2004,
  );

  final String name;
  final String genre;
  final int year;
  final bool watched;

  Movie2({
    required this.name,
    required this.genre,
    required this.year,
    this.watched = false,
  });

  @override
  bool operator ==(Object other) {
    if (other is Movie2) {
      return name == other.name && genre == other.genre && year == other.year;
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(name, genre, year);

  @override
  String toString() => name;
}
