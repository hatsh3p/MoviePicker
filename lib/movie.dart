class Movie {
  String name = "";
  String genre = "";
  int year = 0;
  bool watched = false;

  Movie(this.name);

  void setName(String name) {
    this.name = name;
  }

  void setGenre(String name) {
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
