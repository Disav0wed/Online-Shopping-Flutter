class ProductDetail {
  final String category, name, description, price, quantityInStock;

  List<String> imageUrl = new List.empty();

  ProductDetail(
      {required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.quantityInStock});
}
