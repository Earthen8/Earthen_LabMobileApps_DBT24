import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const WasteMateApp());
}

class WasteMateApp extends StatelessWidget {
  const WasteMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WasteMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E8B57),
          brightness: Brightness.light,
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: const HomeScreen(),
    );
  }
}
