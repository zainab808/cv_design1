import 'package:flutter/material.dart';

class PortfolioCard extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const PortfolioCard({
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  State<PortfolioCard> createState() => PortfolioCardState();
}

class PortfolioCardState extends State<PortfolioCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: isHovered
            ? (Matrix4.identity()..scale(1.02)) // zoom on hover
            : Matrix4.identity(),
        child: Stack(
          children: [
            // background image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
            ),

            // buttons overlay (visible on hover)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isHovered ? 1 : 0,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _HoverButton(text: "Preview"),
                    _HoverButton(text: "Use Template"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🟥 Red Buttons (reusable)
class _HoverButton extends StatelessWidget {
  final String text;

  const _HoverButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
