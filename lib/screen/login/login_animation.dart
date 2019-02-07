import 'package:flutter/material.dart';

class LoginEnterAnimation {
  LoginEnterAnimation(this.controller)
      : userNameOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.6,
              0.7,
              curve: Curves.easeIn,
            ),
          ),
        ),
        passowrdOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.7,
              0.8,
              curve: Curves.easeIn,
            ),
          ),
        ),
        translation = new Tween(begin: 1000.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.4,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        backgroundTranslation = new Tween(begin: 1000.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.5,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        buttontranslation = new Tween(begin: 1000.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        )

        ;

  final AnimationController controller;
  final Animation<double> userNameOpacity;
  final Animation<double> passowrdOpacity;
  final Animation<double> translation;
  final Animation<double> backgroundTranslation;
  final Animation<double> buttontranslation;
}
