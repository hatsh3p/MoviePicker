import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

import 'movie.dart';

Future<List<Movie>> createMovieListFromCSV(String path) async {
  var content = await rootBundle.loadString(path);

  List<Movie> movies = <Movie>[];

  for (var line in LineSplitter.split(content)) {
    final columns = line.split(',');
    var name = columns.elementAt(0);
    var genre = columns.elementAt(1);
    var yearColumn = columns.elementAt(2);
    int year = int.tryParse(yearColumn) ?? 0;
    var watchedColumn = columns.elementAt(4);
    var watched = false;
    if (equalsIgnoreCase(watchedColumn, "yes")) {
      watched = true;
    }
    Movie movie = Movie(name: name, genre: genre, year: year, watched: watched);
    movies.add(movie);
  }
  return movies;
}

List<Movie> pickThreeMovies(List<Movie> list) {
  List<Movie> threeMovies = [];
  for (int i = 0; i < 3; i++) {
    var random = Random().nextInt(list.length);
    threeMovies.add(list[random]);
  }
  return threeMovies;
}

bool equalsIgnoreCase(String string1, String string2) {
  return string1.toLowerCase() == string2.toLowerCase();
}

/*
main() {
  List<Movie> movieList = createMovieListFromCSV("list.csv");
  List<Movie> threeMovies = pickThreeMovies(movieList);
  print(threeMovies);
}
*/
