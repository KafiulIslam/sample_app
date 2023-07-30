import 'package:flutter/material.dart';
import 'package:sample_app/utils/colors.dart';
import 'package:sample_app/view/authentication/login/login_screen.dart';
import 'package:sample_app/view/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        scaffoldBackgroundColor: scaffoldBackground,
        primaryColor: primaryColor,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

