import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double fahrenheit = 0;

  void convert(String value) {
    double celsius = double.tryParse(value) ?? 0;
    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.thermostat_outlined,
                size: 120, color: Colors.white),
            const Center(
              child: Text("Converter",
                  style: TextStyle(color: Colors.white, fontSize: 45)),
            ),
            const SizedBox(height: 50),

            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter a temperature",
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: convert,
            ),

            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                fahrenheit.toStringAsFixed(1),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
