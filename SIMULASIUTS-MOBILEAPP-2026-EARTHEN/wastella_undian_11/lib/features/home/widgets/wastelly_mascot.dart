import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class WastellyMascot extends StatelessWidget {
  const WastellyMascot({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mascot avatar placeholder
        Container(
          width: 100,
          height: 100,
          decoration: const ShapeDecoration(
            color: AppColors.accent,
            shape: OvalBorder(),
          ),
          child: const Icon(Icons.eco, size: 50, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        const Text(
          'Wastelly',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        // XP progress bar
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Lvl. 01',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 120,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: FractionallySizedBox(
                widthFactor: 0.1,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              'Lvl. 02',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Text(
          '10/100',
          style: TextStyle(
            fontSize: 8,
            fontFamily: 'Poppins',
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
