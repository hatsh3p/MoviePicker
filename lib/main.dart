import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'movie.dart';
import 'movie_picker.dart';

void main() async {
  // TODO: Matan to help you get rid of this.
  WidgetsFlutterBinding.ensureInitialized();
  final movieList = await createMovieListFromCSV("assets/list.csv");
  runApp(MyApp(movies: movieList));
}

// -- Light Theme ---
const lightPrimary = Color.fromARGB(255, 229, 247, 125);
const lightAccent = Color.fromARGB(255, 130, 2, 99);
const lightBackground = Color.fromARGB(255, 212, 228, 236);
const lightVeto = Color.fromARGB(255, 255, 186, 213);
const lightResult = Color.fromARGB(255, 145, 255, 10);
const lightButton = Color.fromARGB(255, 255, 0, 200);
const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightPrimary,
    onPrimary: lightAccent,
    secondary: lightBackground,
    onSecondary: lightAccent,
    error: lightPrimary,
    onError: lightAccent,
    background: lightBackground,
    onBackground: lightBackground,
    surface: lightBackground,
    onSurface: lightAccent);

//TODO: Add Dark Theme.

class MyApp extends StatelessWidget {
  final List<Movie> movies;

  // TODO: Replace with const MyApp
  const MyApp({required this.movies, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Picker',
      home: HomePage(title: 'Movie Picker', movies: movies),
      theme: ThemeData(colorScheme: lightColorScheme),
      //darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Movie> movies;
  const HomePage({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
            title: Text(
          title,
          style: GoogleFonts.creepster(fontSize: 40),
        )),
        const SizedBox(height: 50),
        Text(
            'Picking something to watch is hard.\n\n Let us pick three movies from your list,\n then you and a friend each veto one.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 50),
        Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/recolored_popcorn.png')),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () async {
            var messsage = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return MoviePage(
                title: 'Movie Picker',
                movies: pickThreeMovies(movies),
              );
            }));
            print(messsage);
          },
          child: Text('Pick 3',
              style: GoogleFonts.creepster(fontSize: 40, color: lightButton)),
        ),
      ],
    );
  }
}

class MoviePage extends StatelessWidget {
  const MoviePage({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);
  final String title;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AppBar(title: Text(title, style: GoogleFonts.creepster(fontSize: 40))),
      const SizedBox(height: 30),
      Text('Veto Two',
          textAlign: TextAlign.center,
          style: GoogleFonts.creepster(
              fontSize: 40,
              color: lightButton,
              decoration: TextDecoration.none)),
      const SizedBox(height: 20),
      SizedBox(
          height: 400,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: movies.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                final movie = movies[index];
                return SelectableCard(
                  card: Card(
                    child: ListTile(
                      title: Text(movie.name),
                      subtitle: Text('${movie.year} ${movie.genre}'),
                      leading: const Icon(Icons.local_movies),
                    ),
                  ),
                );
              }))
    ]);
  }
}

class SelectableCard extends StatefulWidget {
  final Card card;

  const SelectableCard({Key? key, required this.card}) : super(key: key);

  @override
  _SelectableCardState createState() => _SelectableCardState();
}

class _SelectableCardState extends State<SelectableCard> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: Card(
        color: isSelect ? lightVeto : widget.card.color,
        shape: widget.card.shape,
        child: widget.card.child,
      ),
    );
  }
}
