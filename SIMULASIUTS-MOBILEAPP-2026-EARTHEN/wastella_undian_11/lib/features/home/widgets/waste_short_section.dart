import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/section_header.dart';

class WasteShortSection extends StatelessWidget {
  const WasteShortSection({super.key});

  static const _items = [
    _ShortItem('Start your action', 'https://placehold.co/166x232'),
    _ShortItem('Easy handcrafts', 'https://placehold.co/164x232'),
    _ShortItem('Use of cartons', 'https://placehold.co/166x232'),
    _ShortItem('Waste in our daily', 'https://placehold.co/164x232'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'WasteShort', onViewAll: () {}),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 166 / 232,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return _ShortCard(item: _items[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ShortCard extends StatelessWidget {
  final _ShortItem item;

  const _ShortCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image placeholder
          Container(
            color: AppColors.primary.withOpacity(0.3),
            child: const Icon(
              Icons.play_circle_outline,
              size: 48,
              color: Colors.white54,
            ),
          ),
          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          // Title at bottom
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                shadows: [
                  Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShortItem {
  final String title;
  final String imageUrl;

  const _ShortItem(this.title, this.imageUrl);
}
