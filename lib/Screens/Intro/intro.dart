import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/Components/custom_button.dart';
import 'package:coffee_app/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              Color.fromRGBO(0, 0, 0, 0),
              Color.fromRGBO(0, 0, 0, 0.77)
            ])),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://images.unsplash.com/photo-1610632380989-680fe40816c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvZmZlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')))),
          ),
          Text('Coffee so good, \n your taste buds \n will love it.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text('The best grain, the finest roast, the \n powerfull flavour.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 14, color: Color.fromRGBO(132, 123, 123, 1))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomButton(
                  child: Text('Get started',
                      style: GoogleFonts.openSans(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  press: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  }))
        ],
      ),
    );
  }
}
