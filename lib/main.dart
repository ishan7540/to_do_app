import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.yellow),
        primaryColor: Colors.yellow,
        useMaterial3: false,
      ),
    );
  }
}
