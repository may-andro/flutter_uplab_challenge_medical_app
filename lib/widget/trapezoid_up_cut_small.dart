import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TrapezoidUpCutSmall extends StatelessWidget {
  TrapezoidUpCutSmall({@required this.child});

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

    path.lineTo(size.width * 0.3, size.height);

    path.lineTo(size.width * 0.67, size.height * 0.8);

    path.quadraticBezierTo(size.width * 0.77, size.height * 0.75, size.width * 0.87, size.height * 0.8);

    path.lineTo(size.width, size.height * 0.88);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width * 0.3, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
