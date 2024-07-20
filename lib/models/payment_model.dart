class PaymentModel {
  final int idUser;
  final String tanggalSewa;
  final String tanggalKembali;
  final List<ItemPaymentModel> dataItem;

  PaymentModel(
      {required this.dataItem,
      required this.idUser,
      required this.tanggalKembali,
      required this.tanggalSewa});

  Map<String, dynamic> toJSON() {
    return {
      "id_user": idUser,
      "tanggal_sewa": tanggalSewa,
      "tanggal_kembali": tanggalKembali,
      "data": dataItem
    };
  }
}

class ItemPaymentModel {
  final int idItem;
  final int quantity;

  ItemPaymentModel({required this.idItem, required this.quantity});

  Map<String, dynamic> toJSON() {
    return {"id_item": idItem, "quantity": quantity};
  }
}
