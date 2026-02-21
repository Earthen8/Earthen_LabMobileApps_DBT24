import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 36),
            itemBuilder: (context, index) {
              final item = _categories[index];
              return GestureDetector(
                onTap: () {
                  if (item.label == 'Organic') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const OrganicWasteEducationScreen(),
                      ),
                    );
                  } else if (item.label == 'Inorganic') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const InorganicWasteEducationScreen(),
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
      svgPath: 'assets/vectors/organic.svg',
    ),
    _CategoryItem(
      label: 'Inorganic',
      bgColor: Color(0x304682B4), // Light Blue
      svgPath: 'assets/vectors/inorganic.svg',
    ),
    _CategoryItem(
      label: 'Hazardous',
      bgColor: Color(0x1EFF9564), // Light Red/Orange
      svgPath: 'assets/vectors/hazardous.svg',
    ),
    _CategoryItem(
      label: 'Paper',
      bgColor: Color(0x1E964B00), // Light Brown
      svgPath: 'assets/vectors/paper.svg',
    ),
    _CategoryItem(
      label: 'Residual',
      bgColor: Color(0x4C8E8585), // Light Gray
      svgPath: 'assets/vectors/residual.svg',
    ),
  ];
}

class _CategoryItem {
  final String label;
  final Color bgColor;
  final String svgPath;

  const _CategoryItem({
    required this.label,
    required this.bgColor,
    required this.svgPath,
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
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 7.70,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              item.svgPath,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.47,
          ),
        ),
      ],
    );
  }
}
