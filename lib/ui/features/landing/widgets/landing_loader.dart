import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomLoaderMusic extends StatefulWidget {
  const CustomLoaderMusic({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  State<CustomLoaderMusic> createState() => _CustomLoaderMusicState();
}

class _CustomLoaderMusicState extends State<CustomLoaderMusic>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 100,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => CustomPaint(
            painter: WavePainter(_controller.value, widget.color),
            child: const SizedBox(
              height: 5,
              width: 70,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WavePainter extends CustomPainter {
  final double progress;

  WavePainter(this.progress, this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 4,
        size.height / 2 + 20.0 * (math.sin(2 * math.pi * progress) + 1) / 2,
        size.width / 2,
        size.height / 2,
      )
      ..quadraticBezierTo(
        size.width * 3 / 4,
        size.height / 2 - 20.0 * (math.sin(2 * math.pi * progress) + 1) / 2,
        size.width,
        size.height / 2,
      );
    canvas.drawShadow(path, color, 1, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
