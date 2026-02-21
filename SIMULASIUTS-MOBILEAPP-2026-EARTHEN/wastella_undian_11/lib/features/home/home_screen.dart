import 'package:flutter/material.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/wastelly_mascot.dart';
import 'widgets/waste_category_scroll.dart';
import 'widgets/your_mission_section.dart';
import 'widgets/waste_wrap_card.dart';
import 'widgets/waste_short_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 2; // Default to Camera (center)

  final List<({IconData icon, String label})> _navItems = const [
    (icon: Icons.home_filled, label: ''),
    (icon: Icons.shopping_basket_outlined, label: ''),
    (icon: Icons.camera_alt, label: ''), // Center
    (icon: Icons.location_on_outlined, label: ''),
    (icon: Icons.person_outline, label: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .white, // AppColors.background might be gray, but image shows white/light
      body: Stack(
        children: [
          // Scrollable Body
          CustomScrollView(
            slivers: [
              // ── Header Placeholder ─────────────────────────────────────
              const SliverToBoxAdapter(
                child: HomeHeader(userName: 'WasteMate', points: 500),
              ),

              // ── Mascot Section ───────────────────────────────────────────
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Center(child: WastellyMascot()),
                ),
              ),

              // ── What is Waste (Category Scroll) ──────────────────────────
              const SliverToBoxAdapter(child: WasteCategoryScroll()),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Your Mission ─────────────────────────────────────────────
              const SliverToBoxAdapter(child: YourMissionSection()),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── WasteWrap Chart ──────────────────────────────────────────
              const SliverToBoxAdapter(child: WasteWrapCard()),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── WasteShort ───────────────────────────────────────────────
              const SliverToBoxAdapter(child: WasteShortSection()),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // ── WasteDonations Pool ──────────────────────────────────────
              const SliverToBoxAdapter(child: _WasteDonationsCard()),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // ── Leaderboard ──────────────────────────────────────────────
              const SliverToBoxAdapter(child: _LeaderboardCard()),

              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ), // Space for Navbar
            ],
          ),

          // Bottom Nav Bar (Floating)
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: _buildFloatingBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBottomNav() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          final isCenter = index == 2;
          final isSelected = _selectedNavIndex == index;

          if (isCenter) {
            return GestureDetector(
              onTap: () => setState(() => _selectedNavIndex = index),
              child: Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E8B57), // Green circle
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x332E8B57),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(item.icon, color: Colors.white, size: 28),
              ),
            );
          }

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedNavIndex = index),
              behavior: HitTestBehavior.opaque,
              child: Icon(
                item.icon,
                size: 28,
                color: isSelected ? const Color(0xFF2E8B57) : Colors.black87,
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ── Internal helper widgets ─────────────────────────────────────────────────

class _WasteDonationsCard extends StatelessWidget {
  const _WasteDonationsCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'WasteDonations Pool',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Total Funds',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Rp12.100.000',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4D3E), // Dark Green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Make my contribution',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeaderboardCard extends StatelessWidget {
  const _LeaderboardCard();

  static const _leaders = [
    _Leader('Earthen', 14000, 1, 'https://placehold.co/40x40'),
    _Leader('Vincent', 13000, 2, 'https://placehold.co/40x40'),
    _Leader('Peter', 12000, 3, 'https://placehold.co/40x40'),
    _Leader('Dobleh', 11000, 4, 'https://placehold.co/40x40'),
    _Leader('Apeh', 10000, 5, 'https://placehold.co/40x40'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white, // Should be white? Check image.
          // Image shows separate rounded container for leaderboard
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.leaderboard, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Waste Leaderboard (Top 10)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),

            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _leaders.length,
              separatorBuilder: (c, i) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = _leaders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      if (item.rank == 1)
                        const Icon(
                          Icons.emoji_events,
                          color: Color(0xFFFFD700),
                          size: 20,
                        )
                      else
                        SizedBox(
                          width: 20,
                          child: Text(
                            '${item.rank}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(item.imageUrl),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '${item.points} Points',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),

            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Your points :',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '100 Points',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Leader {
  final String name;
  final int points;
  final int rank;
  final String imageUrl;

  const _Leader(this.name, this.points, this.rank, this.imageUrl);
}
