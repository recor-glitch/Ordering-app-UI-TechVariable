import 'package:coffee_app/Components/custom_button.dart';
import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/Screens/Order/components/payment.dart';
import 'package:coffee_app/Screens/Order/components/quantity.dart';
import 'package:coffee_app/Screens/Order/components/small_buttons.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
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
      backgroundColor: Color.fromRGBO(231, 231, 231, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Color.fromRGBO(27, 25, 25, 1))),
                  Text('Order',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1)
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TabBar(
                controller: controller,
                labelColor: Color.fromRGBO(255, 255, 255, 1),
                unselectedLabelColor: textcolorblack,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(198, 124, 78, 1)),
                tabs: [
                  Tab(
                    text: 'Delivery',
                  ),
                  Tab(
                    text: 'Pick Up',
                  )
                ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery Address',
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textcolorblack)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Biraj Das',
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: textcolorblack,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text('Nabagiri Road, Chandmari, Assam',
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(129, 126, 126, 1))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallButton(
                            icon: Icons.edit,
                            name: 'Edit Address',
                            press: () {}),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SmallButton(
                            icon: Icons.note_outlined,
                            name: 'Add Note',
                            press: () {})
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Divider(
                        color: Color.fromRGBO(187, 172, 172, 1),
                        thickness: 1,
                        height: 0.5),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    QuantityRow(product: widget.product),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Divider(
                        color: Color.fromRGBO(249, 236, 236, 1),
                        thickness: 1,
                        height: 0.5),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color.fromRGBO(0, 0, 0, 0.25))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.new_releases,
                              size: 30,
                              color: Color.fromRGBO(198, 124, 78, 1),
                            ),
                            Text('1 Discount is applied',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: textcolorblack)),
                            Icon(Icons.navigate_next, color: textcolorblack)
                          ]),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Payment Summary',
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textcolorblack)),
                    Payment(amt: double.parse(widget.product.price)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomButton(
                        child: Text('Order',
                            style: GoogleFonts.openSans(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        press: () {})
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
