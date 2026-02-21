import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrganicWasteEducationScreen extends StatefulWidget {
  const OrganicWasteEducationScreen({super.key});

  @override
  State<OrganicWasteEducationScreen> createState() =>
      OrganicWasteEducationScreenState();
}

class OrganicWasteEducationScreenState
    extends State<OrganicWasteEducationScreen> {
  String? _selectedImage;

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
          'Organic Waste',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/organic_education/introduction.png',
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Examples Section
            const Text(
              'Examples of Organic Waste',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 300, child: _AnimatedWasteCarousel()),

            const SizedBox(height: 32),

            // Environmental Impacts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Environmental Impacts of Organic Waste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 24),

            _selectedImage != null
                ? GestureDetector(
                    onTap: () => setState(() => _selectedImage = null),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/organic_education/organic_info/images/$_selectedImage.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      alignment: WrapAlignment.center,
                      children:
                          [
                                'water_pollution',
                                'air_quality',
                                'nutrient_cycling',
                                'pest_issues',
                                'carbon_storage',
                                'energy_generation',
                              ]
                              .map(
                                (name) => GestureDetector(
                                  onTap: () =>
                                      setState(() => _selectedImage = name),
                                  child: SvgPicture.asset(
                                    'assets/images/organic_education/organic_info/button/$name.svg',
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),

            const SizedBox(height: 12),
            const Text(
              'and more!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            // Myth and Facts
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Myth and Facts About Organic Waste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const SizedBox(height: 420, child: MythFactCardStack()),

            const SizedBox(height: 32),

            // Why Matters
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Why Managing Organic Waste Matters',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const ManageWasteStack(),

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
                    color: const Color(0xFF2E8B57).withValues(alpha: 0.3),
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

// Carousel with gap between cards via padding
class _AnimatedWasteCarousel extends StatefulWidget {
  const _AnimatedWasteCarousel();

  @override
  State<_AnimatedWasteCarousel> createState() => _AnimatedWasteCarouselState();
}

class _AnimatedWasteCarouselState extends State<_AnimatedWasteCarousel> {
  late final PageController _pageController;
  int _currentPage = 1000;
  Timer? _timer;

  final List<String> _items = [
    'assets/images/organic_education/examples/paper_waste.png',
    'assets/images/organic_education/examples/wood_waste.png',
    'assets/images/organic_education/examples/textile_waste.png',
    'assets/images/organic_education/examples/manure.png',
    'assets/images/organic_education/examples/yard_waste.png',
    'assets/images/organic_education/examples/food_waste.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6, initialPage: 1000);
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

            final double blur = (1 - value) * 8;
            final double scale = value;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: scale * 300,
                  width: scale * 260,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [Image.asset(item, fit: BoxFit.cover)],
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

class MythFactCardStack extends StatefulWidget {
  const MythFactCardStack({super.key});

  @override
  State<MythFactCardStack> createState() => _MythFactCardStackState();
}

class _MythFactCardStackState extends State<MythFactCardStack> {
  int _currentPairStart = 1;
  bool _isMythFront = true;

  void _onCardTapped() {
    setState(() {
      if (_isMythFront) {
        _isMythFront = false;
      } else {
        _isMythFront = true;
        _currentPairStart += 2;

        if (_currentPairStart > 7) {
          _currentPairStart = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const String basePath = 'assets/images/organic_education/myth_fact';
    final String mythImage = '$basePath/$_currentPairStart.png';
    final String factImage = '$basePath/${_currentPairStart + 1}.png';

    final Widget mythWidget = Positioned(
      top: 0,
      left: 0,
      right: 40,
      bottom: 0,
      child: Image.asset(mythImage, fit: BoxFit.contain),
    );

    final Widget factWidget = Positioned(
      top: 0,
      left: 40,
      right: 0,
      bottom: 0,
      child: Image.asset(factImage, fit: BoxFit.contain),
    );

    return Center(
      child: GestureDetector(
        onTap: _onCardTapped,
        child: SizedBox(
          width: 280,
          height: 380,
          child: Stack(
            children: _isMythFront
                ? [factWidget, mythWidget]
                : [mythWidget, factWidget],
          ),
        ),
      ),
    );
  }
}

class ManageWasteStack extends StatefulWidget {
  const ManageWasteStack({super.key});

  @override
  State<ManageWasteStack> createState() => _ManageWasteStackState();
}

class _ManageWasteStackState extends State<ManageWasteStack> {
  int _selectedIndex = 5;

  void _handleCardTap(int index) {
    setState(() {
      if (index >= _selectedIndex) {
        _selectedIndex = 5;
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const String basePath = 'assets/images/organic_education/manage';
    const double overlapOffset = 50.0;

    List<Widget> cardsAbove = [];
    List<Widget> cardsBelowBlurred = [];
    Widget? selectedCard;

    for (int i = 1; i <= 5; i++) {
      final bool isBlurred = i > _selectedIndex;
      final bool isSelected = i == _selectedIndex;

      Widget cardContent = Image.asset(
        '$basePath/$i.png',
        width: 350,
        fit: BoxFit.contain,
      );

      if (isBlurred) {
        cardContent = ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: cardContent,
        );
      }

      Widget positionedCard = Positioned(
        top: (i - 1) * overlapOffset,
        child: GestureDetector(
          onTap: () => _handleCardTap(i),
          child: cardContent,
        ),
      );

      if (isSelected) {
        selectedCard = positionedCard;
      } else if (isBlurred) {
        cardsBelowBlurred.add(positionedCard);
      } else {
        cardsAbove.add(positionedCard);
      }
    }

    return Center(
      child: SizedBox(
        width: 350,
        height: 450,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ...cardsAbove,
            ...cardsBelowBlurred,
            if (selectedCard != null) selectedCard,
          ],
        ),
      ),
    );
  }
}
