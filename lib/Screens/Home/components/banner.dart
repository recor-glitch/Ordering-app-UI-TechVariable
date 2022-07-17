import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                  'https://images.unsplash.com/photo-1444418776041-9c7e33cc5a9c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGNvZmZlZSUyMGFuZCUyMGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.03,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(237, 81, 81, 1)),
          child: Text('Promo',
          textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Color.fromRGBO(255, 255, 255, 1))),
        ),
        Text('Buy one get\n one FREE',
            style: GoogleFonts.openSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1)))
          ],
        ),
      ),
    );
  }
}
