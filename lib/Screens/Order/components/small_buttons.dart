import 'package:coffee_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {Key? key, required this.icon, required this.name, required this.press})
      : super(key: key);

  final IconData icon;
  final String name;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 5),
            Text(name,
                style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textcolorblack))
          ],
        ),
      ),
    );
  }
}
