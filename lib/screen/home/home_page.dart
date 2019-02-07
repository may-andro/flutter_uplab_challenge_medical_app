import 'package:flutter/material.dart';
import 'package:flutter_uplab_onboarding/screen/home/home_animation.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin{

  HomeEnterAnimation enterAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    enterAnimation = HomeEnterAnimation(animationController);

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
      body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildBackgroundImage(size),
                _buildBackgroundGradient(size),
                _buildCard(size, textTheme),
              ],
            );
          })
    );
  }

  _buildBackgroundImage(Size size) => Positioned(
    top: 0,
    bottom: size.height * 0.6,
    left: 0,
    right: 0,
    child: FadeTransition(
      opacity: enterAnimation.fadeTranslation,
      child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/images/doctor.jpg'),
              fit: BoxFit.cover,
            ),
          )),
    ),
  );

  _buildBackgroundGradient(Size size) => Positioned(
    top: size.height * 0.4,
    bottom: 0,
    left: 0,
    right: 0,
    child: FadeTransition(
      opacity: enterAnimation.fadeTranslation,
      child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: <Color>[
                const Color(0xFF5DB09E),
                const Color(0xFF40858B),
                const Color(0xFF042C63),
              ],
            ),
          )),
    ),
  );

  _buildCard(Size size, TextTheme textTheme) => Positioned(
    top: size.height * 0.3,
    bottom: size.height * 0.1,
    left: size.width * 0.05,
    right: size.width * 0.05,
    child: Transform(
      transform: Matrix4.translationValues(0, enterAnimation.Ytranslation.value, 0),
      child: Card(
        elevation: 8,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hello Nasrin",
                  style: textTheme.caption.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Welcome",
                  style: textTheme.subtitle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: (size.width ) / ((size.height * 0.5)),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: menuItems.map((Menu menu) {
                      return menuStack(context, menu);
                    }).toList(),
                  ),
                )
              ],
            )),
      ),
    ),
  );

  Widget menuStack(BuildContext context, Menu menu) => Container(
    decoration: BoxDecoration(
        border: new Border.all(
            color: Theme.of(context).primaryColor),
        borderRadius:
        BorderRadius.all(Radius.circular(4))),
    padding: EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Transform(
              transform: Matrix4.diagonal3Values(enterAnimation.scale.value, enterAnimation.scale.value, 0),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    menu.image),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            menu.title,
            style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}


class Menu {
  String title;
  String image;

  Menu(
      {this.title,
        this.image,
      });
}

final menuItems = <Menu>[
  Menu(
      title: "Book an appointment",
      image: 'assets/images/appointment.png'),
  Menu(
      title: "Your appointment",
      image: 'assets/images/reminder.png'),
  Menu(
      title: "Medical report",
      image: 'assets/images/reports.png'),
  Menu(
      title: "Set medical reminder",
      image: 'assets/images/yourappointments.png'),
];
