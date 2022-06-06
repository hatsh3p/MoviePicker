import 'package:flutter/material.dart';
// FIXME: GoogleFonts not working
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie Picker App',
      home: FirstPage(title: 'Movie Picker'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          var messsage = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const SecondPage(title: 'Veto');
          }));
          print(messsage);
        },
        child: Text('Pick 3 Movies'),
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: SelectableCard(
          card: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const SizedBox(
                width: 500,
                height: 150,
                child: Center(
                    child: Text('Lord of the Rings: The Fellowship of the Ring',
                        style: TextStyle(fontSize: 20))),
              )),
        )));
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
        color: isSelect ? Colors.red : widget.card.color,
        shape: widget.card.shape,
        child: widget.card.child,
      ),
    );
  }
}