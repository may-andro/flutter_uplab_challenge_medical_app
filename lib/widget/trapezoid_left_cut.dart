import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TrapezoidLeftCut extends StatelessWidget {
  TrapezoidLeftCut({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      clipper: new DiagonalClipper(),
      child: child,
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height * 0.9);

    path.lineTo(size.width * 0.8, size.height * 0.5);

    path.quadraticBezierTo(size.width, size.height * 0.4, size.width * 0.8, size.height * 0.3);

    path.lineTo(size.width * 0.2, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
