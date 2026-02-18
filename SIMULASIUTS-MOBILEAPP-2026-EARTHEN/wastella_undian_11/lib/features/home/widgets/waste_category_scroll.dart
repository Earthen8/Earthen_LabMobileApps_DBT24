import 'package:flutter/material.dart';
import '../../education/screens/organic_waste_education_screen.dart';
import '../../education/screens/inorganic_waste_education_screen.dart';
import '../../education/screens/hazardous_waste_education_screen.dart';
import '../../education/screens/residual_waste_education_scree.dart';
import '../../education/screens/paper_waste_education_screen.dart';

class WasteCategoryScroll extends StatelessWidget {
  const WasteCategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'What is waste?',
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100, // Slightly taller to accommodate label
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = _categories[index];
              return GestureDetector(
                onTap: () {
                  if (item.label == 'Organic') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WasteEducationScreen(),
                      ),
                    );
                  } else if (item.label == 'Inorganic') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const NonOrganicWasteEducationScreen(),
                      ),
                    );
                  } else if (item.label == 'Hazardous') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HazardousWasteEducationScreen(),
                      ),
                    );
                  } else if (item.label == 'Paper') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaperWasteEducationScreen(),
                      ),
                    );
                  } else if (item.label == 'Residual') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ResidualWasteEducationScreen(),
                      ),
                    );
                  }
                },
                child: _CategoryCard(item: item),
              );
            },
          ),
        ),
      ],
    );
  }

  static const _categories = [
    _CategoryItem(
      label: 'Organic',
      bgColor: Color(0x302E8B57), // Light Green
      icon: Icons.eco,
      iconColor: Color(0xFF2E8B57),
    ),
    _CategoryItem(
      label: 'Inorganic',
      bgColor: Color(0x304682B4), // Light Blue
      icon: Icons.local_drink_outlined,
      iconColor: Color(0xFF4682B4),
    ),
    _CategoryItem(
      label: 'Hazardous',
      bgColor: Color(0x1EFF9564), // Light Red/Orange
      icon: Icons.warning_amber_rounded,
      iconColor: Color(0xFFFF9564),
    ),
    _CategoryItem(
      label: 'Paper',
      bgColor: Color(0x1E964B00), // Light Brown
      icon: Icons.newspaper,
      iconColor: Color(0xFF964B00),
    ),
    _CategoryItem(
      label: 'Residual',
      bgColor: Color(0x4C8E8585), // Light Gray
      icon: Icons.delete_outline,
      iconColor: Color(0xFF8E8585),
    ),
  ];
}

class _CategoryItem {
  final String label;
  final Color bgColor;
  final IconData icon;
  final Color iconColor;

  const _CategoryItem({
    required this.label,
    required this.bgColor,
    required this.icon,
    required this.iconColor,
  });
}

class _CategoryCard extends StatelessWidget {
  final _CategoryItem item;

  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 59,
          height: 59,
          decoration: ShapeDecoration(
            color: item.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Icon(item.icon, color: item.iconColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          item.label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
