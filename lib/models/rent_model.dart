class RentModel {
  final int idSewa;
  final String idTransaksi;
  final String status;
  final String tanggalSewa;
  final String tanggalKembali;
  final int harga;
  final List<ItemRentModel> itemRents;

  RentModel(
      {required this.harga,
      required this.idSewa,
      required this.status,
      required this.idTransaksi,
      required this.itemRents,
      required this.tanggalKembali,
      required this.tanggalSewa});

  factory RentModel.getDataFromJSON(Map<String, dynamic> json) {
    return RentModel(
        harga: json['harga'] ?? 0,
        status: json['status'] ?? '',
        idSewa: json['id_sewa'] ?? 0,
        idTransaksi: json['id_transaksi'] ?? '',
        itemRents: List<ItemRentModel>.from(
            json['sewa'].map((x) => ItemRentModel.getDataFromJSON(x))),
        tanggalKembali: json['tanggal_kembali'] ?? '',
        tanggalSewa: json['tanggal_sewa'] ?? '');
  }
}

class ItemRentModel {
  final int idBarang;
  final String name;
  final String image;
  final int quantity;

  ItemRentModel(
      {required this.idBarang,
      required this.image,
      required this.name,
      required this.quantity});

  factory ItemRentModel.getDataFromJSON(Map<String, dynamic> json) {
    return ItemRentModel(
        idBarang: json['id_barang'] ?? 0,
        image: json['image'] ?? '',
        name: json['name'] ?? '',
        quantity: json['quantity'] ?? 0);
  }
}
