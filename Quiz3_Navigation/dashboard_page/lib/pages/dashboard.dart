import 'package:flutter/material.dart';
import 'library.dart';
import 'profile.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: DashboardPage()),
  );
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<String> _menuItems = const ['HOME', 'LIBRARY', 'PROFILE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // 1. HEADER (Fixed at the top)
            Container(
              color: const Color(0xFFC8102E),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => _showCustomMenu(context),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                  const Spacer(),
                  Image.asset(
                    '../assets/images/prasmul_putih.png',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            // 2. SCROLLABLE AREA
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A. Main Content
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              '../assets/images/prasmul_biru.png',
                              width: 280,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 40),

                          _buildSectionTitle('VISION'),
                          _buildSectionBody(
                            'A globally recognized School for STEMpreneur Education and Research',
                          ),
                          const SizedBox(height: 24),

                          _buildSectionTitle('MISSION'),
                          _buildSectionBody(
                            'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
                          ),
                          const SizedBox(height: 16),
                          _buildSectionBody(
                            '1. Collaborative learning by enterprising involving interdisciplinary catalytic projects\n'
                            '2. Innovative and impactful research to the society',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 120),

                    // B. Footer
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            '../assets/images/prasmul_putih.png',
                            width: 180,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'BSD City Kavling Edutown I.1\n'
                            'Jl. BSD Raya Utama, BSD City 15339\n'
                            'Kabupaten Tangerang, Indonesia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Tel. (021) 304-50-500\n'
                            'Hp. (+62) 81511662005',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'info@prasetiyamulya.ac.id',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSectionBody(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
      ),
    );
  }

  void _showCustomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 20,
            left: 30,
            right: 30,
          ),

          child: ListView(
            padding: EdgeInsets.zero,
            children: _menuItems.map((item) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  if (item == 'LIBRARY') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LibraryPage(),
                      ),
                    );
                  } else if (item == 'PROFILE') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
