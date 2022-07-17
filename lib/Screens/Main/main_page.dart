import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/Screens/Detail/detail.dart';
import 'package:coffee_app/Screens/Home/components/custombottom.dart';
import 'package:coffee_app/Screens/Home/home.dart';
import 'package:coffee_app/Screens/Order/order_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController controller;
  GlobalKey navigatorkey1 = GlobalKey<NavigatorState>();

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottom(controller: controller),
      body: TabBarView(controller: controller, children: [
        Navigator(
          key: navigatorkey1,
          onGenerateRoute: (RouteSettings setting) {
            switch (setting.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => HomePage());
              case '/detail':
                var product = setting.arguments as ProductModel;
                return MaterialPageRoute(builder: (_) => Detail(product: product));
                case '/order':
                var product = setting.arguments as ProductModel;
                return MaterialPageRoute(builder: (_) => OrderPage(product: product));
              default:
                return MaterialPageRoute(builder: (_) => HomePage());
            }
          },
        ),
        Center(child: Text('PAGE 2')),
        Center(child: Text('PAGE 3')),
        Center(child: Text('PAGE 4'))
      ]),
    );
  }
}
