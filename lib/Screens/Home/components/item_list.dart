import 'package:coffee_app/Model/productmodel.dart';
import 'package:coffee_app/Screens/Home/components/product_card.dart';
import 'package:flutter/cupertino.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: products[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 80),
    );
  }
}
