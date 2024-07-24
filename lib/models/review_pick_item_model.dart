class ReviewPickItemModel {
  final int idBarang;
  final int price;
  final String name;
  final String image;
  final String tanggalKembali;
  final int quantity;
  bool isPicked;

  ReviewPickItemModel(
      {required this.idBarang,
      required this.isPicked,
      required this.name,
      required this.quantity,
      required this.image,
      required this.price,
      required this.tanggalKembali});
}
