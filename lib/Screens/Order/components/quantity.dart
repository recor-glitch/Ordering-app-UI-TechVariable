import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityRow extends StatefulWidget {
  const QuantityRow({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<QuantityRow> createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.product.img),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textcolorblack)),
                Text(widget.product.content,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(148, 133, 133, 1)))
              ],
            )
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if(quantity != 1) {
                    quantity -= 1;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.15))),
                child: Icon(Icons.remove, size: 20, color: Colors.black),
              )
            ),
            SizedBox(width: 10),
            Text(quantity.toString(),
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(quantity != 10) {
                    quantity += 1;
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.15))),
                child: Icon(Icons.add, size: 20, color: Colors.black),
              )
            ),
          ],
        )
      ],
    );
  }
}
