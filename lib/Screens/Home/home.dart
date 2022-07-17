import 'package:coffee_app/Components/custom_appbar.dart';
import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/Screens/Home/components/banner.dart';
import 'package:coffee_app/Screens/Home/components/custombottom.dart';
import 'package:coffee_app/Screens/Home/components/item_list.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController minitabcontroller;
  TextEditingController search = TextEditingController();

  List<ProductModel> products = [
    ProductModel(
        name: 'Cappuccino',
        sizes: ['S', 'M', 'L'],
        img:
            'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29mZmVlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        price: '180',
        rating: '4.8',
        desc:
            'Coffee is darkly colored, bitter, slightly acidic and has a stimulating effect in humans, primarily due to its caffeine content. It is one of the most popular drinks in the world and can be prepared and presented in a variety of ways (e.g., espresso, French press, caffè latte, or already-brewed canned coffee).',
        content: 'with Chocolate'),
    ProductModel(
        name: 'Cappuccino',
        sizes: ['S', 'M', 'L'],
        img:
            'https://images.unsplash.com/photo-1534778101976-62847782c213?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FwcHVjY2lub3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        price: '120',
        rating: '4.9',
        content: 'with Oat Milk',
        desc:
            'Coffee is darkly colored, bitter, slightly acidic and has a stimulating effect in humans, primarily due to its caffeine content. It is one of the most popular drinks in the world and can be prepared and presented in a variety of ways (e.g., espresso, French press, caffè latte, or already-brewed canned coffee).'),
    ProductModel(
        name: 'Machiato',
        sizes: ['S', 'M', 'L'],
        img:
            'https://images.unsplash.com/photo-1656423371532-90a4936b0e45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFjaGlhdG98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        price: '150',
        rating: '4.6',
        content: 'with Honney Cyrup',
        desc:
            'Coffee is darkly colored, bitter, slightly acidic and has a stimulating effect in humans, primarily due to its caffeine content. It is one of the most popular drinks in the world and can be prepared and presented in a variety of ways (e.g., espresso, French press, caffè latte, or already-brewed canned coffee).'),
    ProductModel(
        name: 'Latte',
        sizes: ['S', 'M', 'L'],
        img:
            'https://images.unsplash.com/photo-1572097662444-003d63fe5884?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGxhdHRlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        price: '150',
        rating: '4.5',
        content: 'with Rose Milk',
        desc:
            'Coffee is darkly colored, bitter, slightly acidic and has a stimulating effect in humans, primarily due to its caffeine content. It is one of the most popular drinks in the world and can be prepared and presented in a variety of ways (e.g., espresso, French press, caffè latte, or already-brewed canned coffee).'),
  ];

  @override
  void initState() {
    minitabcontroller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    minitabcontroller.dispose();
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 231, 231, 1),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromRGBO(20, 20, 20, 1),
                Color.fromRGBO(48, 48, 48, 1)
              ])),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomAppBar(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  controller: search,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      isDense: true,
                      prefixIcon:
                          Icon(Icons.search, size: 25, color: iconcolor),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            child: Icon(Icons.coffee, color: iconcolor),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: yellow)),
                      ),
                      hintText: 'Search Coffee',
                      hintStyle:
                          GoogleFonts.openSans(fontSize: 14, color: textcolor)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomBanner(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromRGBO(114, 109, 109, 1),
                    isScrollable: true,
                    controller: minitabcontroller,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: yellow),
                    tabs: [
                      Tab(text: 'Cappuccino'),
                      Tab(text: 'Machiato'),
                      Tab(text: 'Latte'),
                      Tab(text: 'Espresso'),
                      Tab(text: 'Dark Coffee')
                    ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: minitabcontroller,
                        children: [
                      ItemList(products: products),
                      ItemList(products: products),
                      ItemList(products: products),
                      ItemList(products: products),
                      ItemList(products: products)
                    ]))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
