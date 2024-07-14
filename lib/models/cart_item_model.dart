class CartItemModel {
  final int idItem;
  final String name;
  final String image;
  final String type;
  final String deskripsi;
  final int stock;
  final int price;
  final dynamic rating;
  final bool isHeader;
  int quantity;
  bool isPicked;

  CartItemModel(
      {required this.deskripsi,
      required this.idItem,
      required this.isHeader,
      required this.image,
      required this.quantity,
      required this.isPicked,
      required this.name,
      required this.price,
      required this.rating,
      required this.stock,
      required this.type});
}
