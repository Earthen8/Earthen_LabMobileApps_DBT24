import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UniversityHomePage(),
    ),
  );
}

class UniversityHomePage extends StatelessWidget {
  const UniversityHomePage({super.key});

  final List<String> _menuItems = const [
    'PROGRAMS',
    'ADMISSION',
    'PEOPLE',
    'LABORATORY',
    'CAMPUS LIFE',
    'OFFICE & SERVICES',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFFC8102E),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/prasmul_putih.png',
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showCustomMenu(context),
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/prasmul_biru.png',
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
              const SizedBox(height: 40),
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
                      'assets/images/prasmul_putih.png',
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
      backgroundColor: const Color(0xFF333333),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _menuItems.map((item) {
              return ListTile(
                title: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showNotification(context, item);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showNotification(BuildContext context, String itemName) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Informasi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('$itemName clicked'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
