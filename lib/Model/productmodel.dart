class ProductModel {
  ProductModel(
      {required this.name,
      required this.content,
      required this.img,
      required this.price,
      required this.rating,
      required this.sizes,
      required this.desc});
  final String name, desc, img, price, rating, content;
  final List sizes;
}
