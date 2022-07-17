import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/Components/custom_button.dart';
import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/Providers/size_provider.dart';
import 'package:coffee_app/Screens/Detail/components/expanddesc.dart';
import 'package:coffee_app/Screens/Detail/components/size_container.dart';
import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  Detail({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  int selected_size = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: Color.fromRGBO(231, 231, 231, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Color.fromRGBO(27, 25, 25, 1))),
                    Text('Details',
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(Icons.favorite_outline,
                            color: Color.fromRGBO(27, 25, 25, 1)))
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(product.img)))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(product.name,
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textcolorblack)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(product.content,
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Color.fromRGBO(148, 133, 133, 1),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Color.fromRGBO(251, 190, 33, 1), size: 25),
                        Text.rich(TextSpan(
                            text: product.rating,
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: ' (230)',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: Color.fromRGBO(148, 133, 133, 1)))
                            ])),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Divider(
                        color: Color.fromRGBO(187, 172, 172, 1),
                        thickness: 1,
                        height: 0.5),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Description',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textcolorblack)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ExpandedDesc(desc: product.desc),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Size',
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textcolorblack)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ChangeNotifierProvider(
                      create: (BuildContext context) => SizeProvider(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product.sizes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Consumer<SizeProvider>(builder:
                                  (BuildContext context, sizeprovider, child) {
                                selected_size = sizeprovider.sizeindex;
                                return SizeContainer(
                                    size: product.sizes[index],
                                    press: () {
                                      sizeprovider.ChangeSize(index);
                                    },
                                    isclicked: sizeprovider.sizeindex == index);
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(148, 133, 133, 1))),
                            Text('₹ ${product.price}',
                                style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: yellow))
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                        Expanded(
                            child: CustomButton(
                                press: () {
                                  Navigator.pushNamed(context, '/order',
                                      arguments: product);
                                },
                                child: Text('Buy Now',
                                    style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))))
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
