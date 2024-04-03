import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // Adjust other properties as needed
          ),
          // Define other text styles using Comfortaa as needed
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
