import 'package:coffee_app/Screens/Intro/intro.dart';
import 'package:coffee_app/Screens/Main/main_page.dart';
import 'package:flutter/material.dart';

class AutoRouter {
  Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => IntroPage());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainPage());
      default:
        return MaterialPageRoute(builder: (_) => IntroPage());
    }
  }
}