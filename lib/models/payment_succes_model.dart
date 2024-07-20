class PaymentSuccesModel {
  final String orderId;
  final String paymentUrl;
  final int idUser;
  final List<PaymentItemSuccesModel> items;
  PaymentSuccesModel(
      {required this.idUser,
      required this.items,
      required this.orderId,
      required this.paymentUrl});

  factory PaymentSuccesModel.getDataFromJSON(Map<String, dynamic> json) {
    return PaymentSuccesModel(
        idUser: json['id_user'] ?? 0,
        items: List<PaymentItemSuccesModel>.from(json['items']
            .map((x) => PaymentItemSuccesModel.getDataFromJSON(x))),
        orderId: json['order_id'] ?? '',
        paymentUrl: json['payment_link'] ?? '');
  }
}

class PaymentItemSuccesModel {
  final String brand;
  final String name;
  final int price;
  final int quantity;

  PaymentItemSuccesModel(
      {required this.brand,
      required this.name,
      required this.price,
      required this.quantity});

  factory PaymentItemSuccesModel.getDataFromJSON(Map<String, dynamic> json) {
    return PaymentItemSuccesModel(
        brand: json['brand'] ?? '',
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        quantity: json['quantity'] ?? 0);
  }
}
