// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF90CAF9), 
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 237, 237),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              WeatherCard(
                city: "Phnom Penh",
                weatherIcon: "../assets/cloudy.png",
                current: 12.2,
                min: 10,
                max: 30,
                color: Color.fromARGB(255, 135, 17, 156),
              ),
              SizedBox(height: 20),

              WeatherCard(
                city: "Paris",
                weatherIcon: "../assets/sunnyCloudy.png",
                current: 22.2,
                min: 10,
                max: 40,
                color: Colors.greenAccent,
              ),
              SizedBox(height: 20),

              WeatherCard(
                city: "Rome",
                weatherIcon: "../assets/sunny.png",
                current: 45.2,
                min: 10,
                max: 40,
                color: Color.fromARGB(255, 223, 56, 101),
              ),
              SizedBox(height: 20),

              WeatherCard(
                city: "Toulouse",
                weatherIcon: "../assets/veryCloudy.png",
                current: 45.2,
                min: 10,
                max: 40,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final String weatherIcon;
  final double current;
  final double min;
  final double max;
  final Color color;

  const WeatherCard({
    super.key,
    required this.city,
    required this.weatherIcon,
    required this.current,
    required this.min,
    required this.max,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.4),
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // Decorative glowing oval
          Positioned(
            right: -40,
            top: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.18),
              ),
            ),
          ),

          // Actual card background & content
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.8),
                  color.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LEFT SIDE — icon + city + min/max
                Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage(weatherIcon),
                    ),
                    const SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          "Min: $min.0°C",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Max: $max.0°C",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),

                // RIGHT SIDE — big current temp
                Text(
                  "${current.toStringAsFixed(1)}°C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}