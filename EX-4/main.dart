import 'package:flutter/material.dart';
import 'data/jokes.dart';
import 'widgets/favorite_card.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JokesPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class JokesPage extends StatefulWidget {
  @override
  State<JokesPage> createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  int? favoriteId; 

  void setFavorite(int id) {
    setState(() {
      favoriteId = id; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokesDB.length,
        itemBuilder: (context, index) {
          final joke = jokesDB[index];
          return FavoriteCard(
            joke: joke,
            appColor: appColor,
            isFavorite: favoriteId == joke.id,
            onFavoriteClick: () => setFavorite(joke.id),
          );
        },
      ),
    );
  }
}
