import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({Key? key, required this.controller}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Color.fromRGBO(0, 0, 0, 1),
      indicatorSize: TabBarIndicatorSize.label,
      controller: controller,
      labelColor: Color.fromRGBO(0, 0, 0, 1),
      unselectedLabelColor: Color.fromRGBO(143, 136, 136, 1),
      tabs: [
      Tab(icon: Icon(Icons.home_outlined, size: 30)),
      Tab(icon: Icon(Icons.favorite_border_outlined, size: 30)),
      Tab(icon: Icon(Icons.shopping_bag_outlined, size: 30)),
      Tab(icon: Icon(Icons.notifications_outlined, size: 30))
    ]);
  }
}
