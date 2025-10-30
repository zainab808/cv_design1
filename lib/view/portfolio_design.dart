import 'package:cv_design/components/headline_text.dart';
import 'package:cv_design/components/portfolio_card.dart';
import 'package:cv_design/components/red_buttons.dart';
import 'package:flutter/material.dart';

class PortfolioDesign extends StatelessWidget {
  const PortfolioDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff081430), // full screen background
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🔹 Headline
                  HeadlineText(),

                  const SizedBox(height: 12),

                  // 🔹 Subtitle
                  Text(
                    'Pick a template. Customize it. Our website templates are designed to stand out no matter what.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Sora",
                      color: Colors.white,
                      fontSize: size.width < 500 ? 14 : 16,
                      height: 1.6,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // 🔹 Cards Grid (Responsive)
                  LayoutBuilder(builder: (context, constraints) {
                    final double available = constraints.maxWidth;

                    double cardWidth = 390;
                    if (available < 1000) {
                      cardWidth = (available / 2) - 24;
                    }
                    if (available < 600) {
                      cardWidth = available;
                    }

                    const double cardHeight = 220;

                    final images = [
                      'flower/p1.png',
                      'flower/p4.png',
                      'flower/p3.png',
                      'flower/p2.png',
                      'flower/p5.png',
                    ];

                    return Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      alignment: WrapAlignment.center,
                      children: images
                          .map(
                            (img) => SizedBox(
                              width: cardWidth,
                              height: cardHeight,
                              child: PortfolioCard(
                                imagePath: img,
                                width: cardWidth,
                                height: cardHeight,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
