import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: product);
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(product.img),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Icon(Icons.grade,
                          size: 10, color: Color.fromRGBO(251, 190, 33, 1)),
                      Text(product.rating,
                          style: GoogleFonts.openSans(
                              fontSize: 10, color: Colors.white))
                    ],
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name,
                  style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(27, 25, 25, 1))),
              Text(product.content,
                  style: GoogleFonts.openSans(
                      fontSize: 12, color: Color.fromRGBO(148, 133, 133, 1))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₹ ${product.price}',
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: yellow),
                        child: Icon(Icons.add, color: Colors.white, size: 20),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

