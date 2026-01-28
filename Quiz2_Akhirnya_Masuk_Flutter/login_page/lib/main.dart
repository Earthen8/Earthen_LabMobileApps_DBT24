import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Demo',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _handleLogin() {
    // Print to console or navigate
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      print("Logging in with $email");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Processing Login..."),
          backgroundColor: Color(0xFFED3838),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 430,
              height: 558,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  // --- TOP BAR ---
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 430,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFED3838),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFED3838), Color(0xFFC42A2A)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  // --- TITLE TEXT ---
                  const Positioned(
                    left: 38,
                    top: 32,
                    child: Text(
                      'Login Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // --- SUBTITLE TEXT ---
                  const Positioned(
                    left: 99,
                    top: 143,
                    child: Text(
                      'Selamat Datang',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // --- EMAIL INPUT ---
                  Positioned(
                    left: 40,
                    top: 233,
                    child: SizedBox(
                      width: 350,
                      height: 70,
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 20,
                            fontFamily: 'Inter',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black.withOpacity(0.50),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFFED3838),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- PASSWORD INPUT ---
                  Positioned(
                    left: 41,
                    top: 323,
                    child: SizedBox(
                      width: 350,
                      height: 70,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 20,
                            fontFamily: 'Inter',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black.withOpacity(0.50),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFFED3838),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- LOGIN BUTTON ---
                  Positioned(
                    left: 41,
                    top: 436,
                    child: InkWell(
                      onTap: _handleLogin,
                      borderRadius: BorderRadius.circular(30),
                      child: Ink(
                        width: 350,
                        height: 60,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF6F6F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.70),
                              fontSize: 25,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- FOOTER ---
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 537,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.flutter_dash,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Aplikasi Demo Flutter',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.50),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
