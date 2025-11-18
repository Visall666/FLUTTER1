import 'package:flutter/material.dart';

const String summerImage = 'assets/images/summer.jpg';
const String fallImage = 'assets/images/fall.jpg';
const String winterImage = 'assets/images/winter.jpg';
const String springImage = 'assets/images/spring.jpg';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black45, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'SEASONS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeasonCard(
                    countryName: 'FRANCE', 
                    seasonImages: [
                      summerImage,
                      fallImage,
                      winterImage,
                      springImage,
                    ],
                  ),
                  SeasonCard(
                    countryName: 'CAMBODIA', 
                    seasonImages: [
                      summerImage,
                      fallImage,
                      winterImage,
                      springImage,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final String countryName;
  final List<String> seasonImages;

  const SeasonCard({super.key, required this.countryName, required this.seasonImages});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentSeasonIndex = 0;

  List<String> seasonNames = ['Winter', 'Spring', 'Summer', 'Fall'];

  String get currentSeasonName => seasonNames[currentSeasonIndex];

  String get currentImagePath => widget.seasonImages[currentSeasonIndex];

  void onNextSeason() {
    setState(() {
      currentSeasonIndex = (currentSeasonIndex + 1) % widget.seasonImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onNextSeason,
            child: Image.asset(
              currentImagePath,
              width: 150,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            widget.countryName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
