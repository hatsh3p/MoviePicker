import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'movie.dart';

List<Movie> movies = [];

List<Movie> createMovieListFromCSV(String path) {
  final File file = File(path);
  var content = file.readAsStringSync();

  List<Movie> movies = <Movie>[];

  for (var line in LineSplitter.split(content)) {
    final columns = line.split(',');
    var movie = Movie(columns.elementAt(0));
    movies.add(movie);
  }
  return movies;
}

List<Movie> pickThreeMovies() {
  List<Movie> threeMovies = [];
  for (int i = 0; i < 3; i++) {
    var random = Random().nextInt(movies.length);
    threeMovies.add(movies[random]);
  }
  return threeMovies;
}

main() {
  movies = createMovieListFromCSV("list.csv");
  List<Movie> threeMovies = pickThreeMovies();
  print(threeMovies);
}
