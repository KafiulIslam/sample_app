import 'package:flutter/material.dart';
import 'package:sample_app/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFf9f9f9),
        primaryColor: const Color(0xFF4942E4),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

