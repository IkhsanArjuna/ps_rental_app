class ItemModel {
  final int idItem;
  final String name;
  final String image;
  final String type;
  final String deskripsi;
  final int stock;
  final int price;
  final dynamic rating;

  ItemModel(
      {required this.deskripsi,
      required this.idItem,
      required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.stock,
      required this.type});

  factory ItemModel.getDataFromJSON(Map<String, dynamic> json) {
    return ItemModel(
        deskripsi: json['deskripsi_barang'] ?? '',
        idItem: json['id_barang'] ?? 0,
        image: json['gambar_barang'] ?? '',
        name: json['nama_barang'] ?? '',
        price: json['harga_sewa'] ?? 0,
        rating: json['rating'] ?? 0.0,
        stock: json['stock'] ?? 0,
        type: json['jenis_barang'] ?? '');
  }
}
