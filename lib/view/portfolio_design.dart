// import 'package:cv_design/components/headline_text.dart';
// import 'package:cv_design/components/portfolio_card.dart';
// import 'package:cv_design/components/red_buttons.dart';
// import 'package:flutter/material.dart';

// class PortfolioDesign extends StatelessWidget {
//   const PortfolioDesign({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: const Color(0xff081430), // full screen background
//       body: SingleChildScrollView(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 1100),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // 🔹 Headline
//                   HeadlineText(),

//                   const SizedBox(height: 12),

//                   // 🔹 Subtitle

                  
//                   Text(
//                     'Pick a template. Customize it. Our website templates are designed to stand out no matter what.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: "Sora",
//                       color: Colors.white,
//                       fontSize: size.width < 500 ? 14 : 16,
//                       height: 1.6,
//                       decoration: TextDecoration.none,
//                     ),
//                   ),

//                   const SizedBox(height: 60),

//                   // 🔹 Cards Grid (Responsive)
//                   LayoutBuilder(builder: (context, constraints) {
//                     final double available = constraints.maxWidth;

//                     double cardWidth = 400;
//                     if (available < 1000) {
//                       cardWidth = (available / 2) - 24;
//                     }
//                     if (available < 600) {
//                       cardWidth = available;
//                     }
//              const double cardHeight = 240;
//           final images = [
//                       'flower/p1.png',
//                       'flower/p4.png',
//                       'flower/p3.png',
//                       'flower/p2.png',
//                       'flower/p5.png',
//                     ];
//       return Wrap(
//                       spacing: 30,
//                       runSpacing: 30,
//                       alignment: WrapAlignment.center,
//                       children: images
//                           .map(
//                             (img) => SizedBox(
//                               width: cardWidth,
//                               height: cardHeight,
//                               child: PortfolioCard(
//                                 imagePath: img,
//                                 width: cardWidth,
//                                 height: cardHeight,
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     );
//                   }),

//                   const SizedBox(height: 60),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cv_design/components/portfolio_card.dart';

class PortfolioDesign extends StatelessWidget {
  const PortfolioDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final images = [
      'flower/p1.png',
      'flower/p4.png',
      'flower/p3.png',
      'flower/p2.png',
      'flower/p5.png',
    ];

    // 🔹 Fixed card dimensions
    final double cardWidth = 420.w;
    final double cardHeight = 320.h;

    return Scaffold(
      backgroundColor: const Color(0xff081430),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),

            /// 🔹 Headline
            Text(
              "Create a personal website\nwith a single click.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Play1",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize:  43.sp,
                height: 1.2,
              ),
            ),

            SizedBox(height: 25.h),

            /// 🔹 Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Pick a template. Customize it. Our website templates are designed to stand out no matter what.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Sora",
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16.sp,
                  height: 1.6,
                ),
              ),
            ),

            SizedBox(height: 70.h),

            /// 🔹 Cards grid
            LayoutBuilder(
              builder: (context, constraints) {
                double spacing = 30.w;
                double totalWidth = (cardWidth * 2) + spacing;

                // 🔹 If screen < 960 → 2 per row with a little side padding
                if (screenWidth < 960) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w), // ⭐ soft side padding added
                    child: Wrap(
                      spacing: spacing,
                      // spacing: 10.w,
                      runSpacing: 30.h,
                      alignment: WrapAlignment.center,
                      children: images
                          .map(
                            (img) => SizedBox(
                              width: (screenWidth / 2) - 40.w, // adjust for side padding
                              height: cardHeight,
                              child: PortfolioCard(
                                imagePath: img,
                                width: (screenWidth / 2) - 20.w,
                                height: cardHeight,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }

                // 🔹 If screen ≥ 960 → centered layout
                return Center(
                  child: SizedBox(
                    width: totalWidth,
                    child: Wrap(
                      spacing: spacing,
                      runSpacing: 30.h,
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
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
