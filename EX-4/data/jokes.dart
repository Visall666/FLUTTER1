class Joke {
  final int id;
  final String title;
  final String description;

  Joke({
    required this.id,
    required this.title,
    required this.description,
  });
}

List<Joke> jokesDB = List.generate(
  20,
  (i) => Joke(
    id: i,
    title: "Joke $i",
    description: "This is a joke number $i",
  ),
);
