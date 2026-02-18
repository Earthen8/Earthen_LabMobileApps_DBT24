import 'package:flutter/material.dart';

class WasteWrapCard extends StatelessWidget {
  const WasteWrapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'WasteWrap',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            _buildLinearBar(
              color: const Color(0xFFFF0000),
              icon: Icons.dangerous_outlined,
              fraction: 0.55,
            ),
            const SizedBox(height: 12),
            _buildLinearBar(
              color: const Color(0xFF008000),
              icon: Icons.keyboard_backspace,
              fraction: 0.95,
            ),
            const SizedBox(height: 12),
            _buildLinearBar(
              color: const Color(0xFF4682B4),
              icon: Icons.local_drink,
              fraction: 0.75,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'See other',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: const [
                _LegendItem(
                  color: Color(0xFF4682B4),
                  label: 'Inorganic',
                  value: '3kg',
                  icon: Icons.local_drink,
                ),
                _LegendItem(
                  color: Color(0xFF008000),
                  label: 'Organic',
                  value: '5kg',
                  icon: Icons.compost,
                ),
                _LegendItem(
                  color: Color(0xFFFF0000),
                  label: 'B3 Waste',
                  value: '2kg',
                  icon: Icons.dangerous,
                ),
                _LegendItem(
                  color: Color(0xFF8E8585),
                  label: 'Residual Waste',
                  value: '2kg',
                  icon: Icons.delete_outline,
                ),
                _LegendItem(
                  color: Color(0xFF964B00),
                  label: 'Paper Waste',
                  value: '2kg',
                  icon: Icons.newspaper,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinearBar({
    required Color color,
    required IconData icon,
    required double fraction,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          alignment: Alignment.centerLeft,
          child: Container(
            width: constraints.maxWidth * fraction,
            height: 35,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        );
      },
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  final IconData icon;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: Colors.white, size: 12),
        ),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
