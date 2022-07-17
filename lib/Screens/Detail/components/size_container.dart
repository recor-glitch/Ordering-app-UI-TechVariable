import 'package:coffee_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer(
      {Key? key,
      required this.press,
      required this.isclicked,
      required this.size})
      : super(key: key);
  final Function() press;
  final bool isclicked;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: isclicked
                  ? Border.all(color: yellow, width: 2)
                  : Border.all(color: Color.fromRGBO(0, 0, 0, 0.25), width: 2)),
          child: Text(size,
          textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isclicked ? yellow : Color.fromRGBO(0, 0, 0, 0.25))),
        ),
      ),
    );
  }
}
