import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Favorite cards"),
    ),
    body: Column(
      children: const [
        FavoriteCard(
          title: "Football",
          description: "Cris.Ronaldo is the GOAT, SUIII!!!!",
          isFavorite: true,
        ),
        FavoriteCard(
          title: "Anime",
          description: "Zenitsu is my favorite character in Demon Slayer.",
          isFavorite: false,
        ),
      ],
    ),
  ),
));

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool selectedFavorite;

  @override
  void initState() {
    super.initState();
    selectedFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.description),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              setState(() {
                selectedFavorite = !selectedFavorite;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: selectedFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
