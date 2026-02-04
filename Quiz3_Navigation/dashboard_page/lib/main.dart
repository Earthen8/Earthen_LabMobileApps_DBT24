import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(const EarthenApp());
}

class EarthenApp extends StatelessWidget {
  const EarthenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthen Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
