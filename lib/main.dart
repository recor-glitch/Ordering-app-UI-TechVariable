import 'dart:io';

import 'package:coffee_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  AutoRouter router = AutoRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechVariable Ordering App',
      onGenerateRoute: router.onGeneratedRoute,
    );
  }
}
