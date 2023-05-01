import 'package:flutter/cupertino.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(
      width * 0.4414,
      height * 0.80,
      width * 0.75,
      height * 0.77,
    );
    path.quadraticBezierTo(
      width * 0.95,
      height * 0.78,
      width,
      height,
    );
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
