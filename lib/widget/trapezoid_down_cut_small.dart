import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TrapezoidDownCutSmall extends StatelessWidget {
  TrapezoidDownCutSmall({@required this.child});

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

    path.lineTo(size.width * 0.3, 0);

    path.lineTo(size.width * 0.74, size.height * 0.22);

    path.quadraticBezierTo(size.width * 0.84, size.height * 0.27, size.width * 0.9, size.height * 0.22);

    path.lineTo(size.width, size.height * 0.15);

    path.lineTo(size.width, 0);

    path.lineTo(size.width * 0.3, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
