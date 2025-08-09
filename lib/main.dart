import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF26A69A), // Teal-ish green
          brightness: Brightness.dark,
          surface: const Color(0xFF1E2A2F), // Dark, almost black-blue
        ),
        scaffoldBackgroundColor: const Color(
          0xFF121A1D,
        ), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E2A2F),
          foregroundColor: Colors.amberAccent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
       
      ),
      home: Scaffold(),
    );
  }
}