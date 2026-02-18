import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class NonOrganicWasteEducationScreen extends StatelessWidget {
  const NonOrganicWasteEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          'Inorganic Waste',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.help_outline, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Header Card
            Center(
              child: Container(
                width: 350,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/noisy-gradients-5.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'What is Inorganic Waste?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Non-biodegradable materials like plastic, metal, and glass don\'t break down naturally, causing pollution. Recycling and proper disposal help reduce their impact',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Examples Section
            const Text(
              'Examples of Inorganic Waste',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            // Increased height and padding layout from organic screen
            const SizedBox(height: 370, child: _AnimatedWasteCarousel()),

            const Text(
              'and more!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // Matches Organic
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 32),

            // Environmental Impacts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Environmental Impacts of Inorganic Waste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: const [
                  _ImpactItem(
                    title: 'Visual\nPollution',
                    icon: Icons.visibility,
                  ),
                  _ImpactItem(
                    title: 'Disaster Risk',
                    icon: Icons.warning_amber_rounded,
                  ),
                  _ImpactItem(title: 'Wildlife Harm', icon: Icons.pets),
                  _ImpactItem(
                    title: 'Landfill Overload',
                    icon: Icons.delete_forever,
                  ),
                  _ImpactItem(title: 'Climate\nImpact', icon: Icons.thermostat),
                  _ImpactItem(
                    title: 'Resource Depletion',
                    icon: Icons.battery_alert,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // Myth and Facts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Myth and Facts About Inorganic Waste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  _MythFactCard(
                    title: 'Fact',
                    color: Color(0xFF3BB270),
                    content:
                        "It breaks into microplastics and releases toxins, polluting for centuries",
                    iconColor: Color(0xFF8B9FFE),
                  ),
                  SizedBox(width: 16),
                  _MythFactCard(
                    title: 'Myth',
                    color: Color(0xFF8B9FFE),
                    content:
                        "Inorganic waste is safe because it doesn’t decompose",
                    iconColor: Color(0xFF3BB270),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Why Matters
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Why Managing Inorganic Waste Matters',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Stacked Card Layout
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _StackedWhyMatterCards(),
            ),

            const SizedBox(height: 48),

            // CTA
            const Text(
              'Ready to make a difference?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Join Wastella and start your journey toward a greener world today!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 260,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E8B57), Color(0xFF0C2517)],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2E8B57).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Make An Impact',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
// Stacked "Why Matter" cards (Same logic as Organic Screen)
// ════════════════════════════════════════════════════════════════
class _StackedWhyMatterCards extends StatefulWidget {
  const _StackedWhyMatterCards();

  @override
  State<_StackedWhyMatterCards> createState() => _StackedWhyMatterCardsState();
}

class _StackedWhyMatterCardsState extends State<_StackedWhyMatterCards>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> _cards = [
    // Non-const because we modify it
    {
      'title': 'Prevents Pollution',
      'description':
          'Proper waste management prevents harmful substances like plastics and chemicals from polluting the environment, keeping ecosystems clean and safe',
    },
    {
      'title': 'Saves Resources',
      'description':
          'Recycling inorganic waste minimizes the need for extracting raw materials, reducing deforestation, mining, and excessive energy consumption',
    },
    {
      'title': 'Protects Wildlife',
      'description':
          'Many animals mistake waste for food or get entangled in discarded materials, which can lead to serious injuries, suffocation, or even death',
    },
    {
      'title': 'Prevents Overcrowding',
      'description':
          'Inorganic waste takes decades to centuries to decompose, leading to overflowing landfills, urban waste buildup, and inefficient land use',
    },
    {
      'title': 'Lower Emissions',
      'description':
          'Proper waste disposal and recycling reduce carbon emissions from industrial production, helping combat climate change',
    },
  ];

  final List<double> _rotations = const [-2.5, -1.2, 0.0, 1.2, 2.5];
  final List<double> _peekOffsets = const [32, 24, 16, 8, 0];

  late AnimationController _animController;
  late Animation<double> _slideAnim;

  bool _isAnimating = false;

  void _onTap() {
    if (_isAnimating) return;
    setState(() => _isAnimating = true);

    _animController.forward(from: 0).then((_) {
      setState(() {
        final top = _cards.removeLast();
        _cards.insert(0, top);
        _isAnimating = false;
      });
      _animController.reset();
    });
  }

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _slideAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const cardHeight = 200.0;
    const stackHeight = cardHeight + 32.0;

    return SizedBox(
      height: stackHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          for (int i = 0; i < _cards.length; i++)
            _buildCard(context, i, cardHeight),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, int i, double cardHeight) {
    final isTop = i == _cards.length - 1;
    final double peekOffset = _peekOffsets[i];
    final double rotation = _rotations[i] * (3.14159 / 180);

    final double scale = 0.88 + (i / (_cards.length - 1)) * 0.12;

    Widget card = Transform.translate(
      offset: Offset(0, -peekOffset),
      child: Transform.rotate(
        angle: rotation,
        child: Transform.scale(
          scale: scale,
          child: _WhyMatterCard(
            title: _cards[i]['title']!,
            description: _cards[i]['description']!,
          ),
        ),
      ),
    );

    if (isTop) {
      card = AnimatedBuilder(
        animation: _slideAnim,
        builder: (context, child) {
          final slideY = _slideAnim.value * -320.0;
          final opacity = 1.0 - _slideAnim.value;
          return Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: Transform.translate(offset: Offset(0, slideY), child: child),
          );
        },
        child: card,
      );

      card = GestureDetector(
        onTap: _onTap,
        child: Stack(
          children: [
            card,
            Positioned(
              bottom: 10,
              right: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.swipe_up, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Tap to explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return card;
  }
}

class _AnimatedWasteCarousel extends StatefulWidget {
  const _AnimatedWasteCarousel();

  @override
  State<_AnimatedWasteCarousel> createState() => _AnimatedWasteCarouselState();
}

class _AnimatedWasteCarouselState extends State<_AnimatedWasteCarousel> {
  late final PageController _pageController;
  int _currentPage = 1000;
  Timer? _timer;

  final List<Map<String, String>> _items = [
    {'label': 'Plastic Bottle', 'image': 'assets/images/plastic-bottle.jpg'},
    {'label': 'Synthetic Rubber', 'image': 'assets/images/plastic-rubber.jpg'},
    {'label': 'Glass Jars', 'image': 'assets/images/glass-jar.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.55, initialPage: 1000);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      itemBuilder: (context, index) {
        final int itemIndex = index % _items.length;
        final item = _items[itemIndex];

        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            } else {
              value = (index == _currentPage) ? 1.0 : 0.7;
            }

            final double blur = (1 - value) * 4;
            final double scale = value;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: Curves.easeOut.transform(scale) * 350,
                  width: Curves.easeOut.transform(scale) * 240,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 32,
                            top: 0,
                          ),
                          child: Text(
                            item['label']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ImpactItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ImpactItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF44FFA3), Color(0xFF047940)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, size: 40, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _MythFactCard extends StatelessWidget {
  final String title;
  final Color color;
  final String content;
  final Color iconColor;

  const _MythFactCard({
    required this.title,
    required this.color,
    required this.content,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyMatterCard extends StatelessWidget {
  final String title;
  final String description;

  const _WhyMatterCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: NetworkImage("https://placehold.co/350x200"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1B4D3E).withOpacity(0.8),
              const Color(0xFF04291F).withOpacity(0.95),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
