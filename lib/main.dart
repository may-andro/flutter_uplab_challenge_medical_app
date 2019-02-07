import 'package:flutter/material.dart';
import 'package:flutter_uplab_onboarding/screen/home/home_page.dart';
import 'package:flutter_uplab_onboarding/screen/login/login_page.dart';
import 'package:flutter_uplab_onboarding/utility/color_utility.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(getColorHexFromStr("#11C9C4")),
        indicatorColor: Color(getColorHexFromStr("#ffffff")),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
      },
      home: LoginPage(),
    );
  }
}
