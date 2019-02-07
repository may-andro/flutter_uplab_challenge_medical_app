import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_uplab_onboarding/screen/login/login_animation.dart';
import 'package:flutter_uplab_onboarding/utility/app_constant.dart';
import 'package:flutter_uplab_onboarding/widget/circular_reveal.dart';
import 'package:flutter_uplab_onboarding/widget/rounded_button.dart';
import 'package:flutter_uplab_onboarding/widget/trapezoid_down_cut_small.dart';
import 'package:flutter_uplab_onboarding/widget/trapezoid_left_cut.dart';
import 'package:flutter_uplab_onboarding/widget/trapezoid_up_cut.dart';
import 'package:flutter_uplab_onboarding/widget/trapezoid_up_cut_small.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginEnterAnimation enterAnimation;
  AnimationController animationController;

  Animation<double> _animation;
  AnimationController revealAnimationController;
  double _fraction = 0.0;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    enterAnimation = LoginEnterAnimation(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildContent(size, textTheme),
          Center(
            child: _fraction > 0
                ? CustomPaint(
                    painter: RevealProgressButtonPainter(
                        _fraction, MediaQuery.of(context).size),
                  )
                : Offstage(),
          ),
          Center(
            child: _fraction == 1 ? CircularProgressIndicator() : Offstage(),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  void reveal() {
    revealAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(revealAnimationController)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });

    revealAnimationController.forward();

    Timer(Duration(milliseconds: 3600), () {
      _fraction = 0;
      Navigator.pushNamed(context, '/home');
    });
  }

  Widget _buildContent(Size size, TextTheme textTheme) => Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              const Color(0xFF7BDDB1),
              const Color(0xFF377885),
              const Color(0xFF265F7A),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildBackgroundCenter(),
            _buildBackgroundTop(),
            _buildBackgroundBottom(),
            _buildBackgroundBottom2(),
            _buildForm(size, textTheme)
          ],
        ),
      );

  _buildBackgroundCenter() => Transform(
        transform: Matrix4.translationValues(
            -enterAnimation.backgroundTranslation.value, 0, 0),
        child: TrapezoidLeftCut(
          child: Container(
            color: Colors.white,
          ),
        ),
      );

  _buildBackgroundTop() => Transform(
        transform: Matrix4.translationValues(
            0, -enterAnimation.backgroundTranslation.value, 0),
        child: TrapezoidDownCutSmall(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomRight,
                colors: <Color>[
                  const Color(0xFF64BCA2),
                  const Color(0xFF468E8E),
                  const Color(0xFF3C7E88),
                ],
              ),
            ),
          ),
        ),
      );

  _buildBackgroundBottom() => Transform(
        transform: Matrix4.translationValues(
            0, enterAnimation.backgroundTranslation.value, 0),
        child: TrapezoidUpCut(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: <Color>[
                  const Color(0xFF468E8E),
                  const Color(0xFF3C7E88),
                ],
              ),
            ),
          ),
        ),
      );

  _buildBackgroundBottom2() => Transform(
        transform: Matrix4.translationValues(
            0, enterAnimation.backgroundTranslation.value, 0),
        child: TrapezoidUpCutSmall(
          child: Container(
            color: Colors.white,
          ),
        ),
      );

  _buildForm(Size size, TextTheme textTheme) => Positioned(
      top: size.height * 0.2,
      left: size.width * 0.08,
      right: size.width * 0.35,
      bottom: size.width * 0.3,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(
                    -enterAnimation.translation.value, 0, 0),
                child: Text(
                  "Login",
                  style: textTheme.display1.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              _buildTextFormUsername(textTheme),
              SizedBox(
                height: 8,
              ),
              _buildTextFormPassword(textTheme),
              SizedBox(
                height: size.height * 0.05,
              ),
              Transform(
                transform: Matrix4.translationValues(
                    -enterAnimation.buttontranslation.value, 0, 0),
                child: RoundedButton(
                  text: BUTTON_LOGIN,
                  onPressed: () => reveal(),
                ),
              )
            ],
          ),
        ),
      ));

  Widget _buildTextFormUsername(TextTheme textTheme) {
    return FadeTransition(
      opacity: enterAnimation.userNameOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(color: Colors.black87),
        decoration: new InputDecoration(
          border: UnderlineInputBorder(),
          labelText: PHONE_AUTH_HINT,
          labelStyle:
              textTheme.caption.copyWith(color: Theme.of(context).primaryColor),
          contentPadding: EdgeInsets.zero,
          suffixIcon: Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
        ),
        keyboardType: TextInputType.text,
        controller: userNameController,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buildTextFormPassword(TextTheme textTheme) {
    return FadeTransition(
      opacity: enterAnimation.passowrdOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(color: Colors.black87),
        decoration: new InputDecoration(
          labelText: PASSWORD_AUTH_HINT,
          labelStyle:
              textTheme.caption.copyWith(color: Theme.of(context).primaryColor),
          contentPadding: const EdgeInsets.all(0.0),
          suffixIcon: Icon(Icons.lock_outline, color: Colors.grey),
        ),
        keyboardType: TextInputType.text,
        controller: passwordController,
        obscureText: true,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }
}
