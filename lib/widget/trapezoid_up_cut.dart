import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TrapezoidUpCut extends StatelessWidget {
  TrapezoidUpCut({@required this.child});

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

    path.lineTo(size.width * 0.02, size.height);

    path.lineTo(size.width * 0.64, size.height * 0.68);

    path.quadraticBezierTo(size.width * 0.8, size.height * 0.6, size.width * 0.92, size.height * 0.68);

    path.lineTo(size.width, size.height * 0.73);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width * 0.02, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
