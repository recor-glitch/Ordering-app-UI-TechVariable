import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandedDesc extends StatefulWidget {
  const ExpandedDesc({Key? key, required this.desc}) : super(key: key);
  final String desc;

  @override
  State<ExpandedDesc> createState() => _ExpandedDescState();
}

class _ExpandedDescState extends State<ExpandedDesc> {
  bool isclicked = false;

  TextStyle style = GoogleFonts.openSans(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(148, 133, 133, 1));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isclicked
            ? Text(widget.desc, style: style)
            : Text(widget.desc, maxLines: 4, overflow: TextOverflow.ellipsis, style: style),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      isclicked = !isclicked;
                    });
                  },
                  child: isclicked
                      ? Text(
                          'see less',
                          style:
                              TextStyle(color: Color.fromRGBO(211, 110, 47, 1)),
                        )
                      : Text(
                          'see more',
                          style:
                              TextStyle(color: Color.fromRGBO(211, 110, 47, 1)),
                        ))
            ],
          ),
        )
      ],
    );
  }
}
