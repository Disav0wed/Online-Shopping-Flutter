class ItemDetail {
  final String category, name, description, price, quantityInStock;

  List<String> imageUrl = new List.empty();

  ItemDetail(
      {required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.quantityInStock});
}
