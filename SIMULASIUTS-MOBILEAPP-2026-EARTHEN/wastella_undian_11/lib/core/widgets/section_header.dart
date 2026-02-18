import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeader({super.key, required this.title, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          if (onViewAll != null)
            GestureDetector(
              onTap: onViewAll,
              child: const Text('view all', style: AppTextStyles.viewAll),
            ),
        ],
      ),
    );
  }
}
