import 'package:flutter/material.dart';
import 'package:project_app/home_screen.dart';
import 'package:project_app/pages/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: const Color(0xFF6C63FF),
        useMaterial3: true,
      ),
      // initialRoute: '',
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const HomeScreen()
      },
    );
  }
}
