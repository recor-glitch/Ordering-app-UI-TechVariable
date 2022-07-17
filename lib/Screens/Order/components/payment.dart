import 'package:coffee_app/Components/custom_button.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key, required this.amt}) : super(key: key);
  final double amt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(95, 88, 88, 1))),
            Text(
              '₹ ${amt.toString()}',
              style: GoogleFonts.openSans(
                  fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(95, 88, 88, 1))),
            Text(
              '₹ 40.00',
              style: GoogleFonts.openSans(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Divider(
            color: Color.fromRGBO(187, 172, 172, 1), thickness: 1, height: 0.5),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Payment',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(95, 88, 88, 1))),
            Text(
              '₹ ${(amt + 40).toString()}',
              style: GoogleFonts.openSans(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Cash',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(198, 124, 78, 1)),
            ),
            Text(
              '₹ ${(amt + 40).toString()}',
              style: GoogleFonts.openSans(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(115, 111, 111, 1)),
                child: Icon(Icons.more_horiz, size: 20, color: Colors.white))
          ],
        )
      ],
    );
  }
}
