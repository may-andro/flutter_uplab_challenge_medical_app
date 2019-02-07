import 'package:flutter/material.dart';

class HomeEnterAnimation {
  HomeEnterAnimation(this.controller)
      : scale = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.6,
              0.9,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        Ytranslation = new Tween(begin: 1000.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.2,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        fadeTranslation = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.3,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> Ytranslation;
  final Animation<double> fadeTranslation;
}
