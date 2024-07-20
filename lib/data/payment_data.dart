import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/payment_model.dart';
import 'package:ps_rental_app/models/payment_succes_model.dart';

class PaymentData {
  Future<PaymentSuccesModel?> createPaymentItem(PaymentModel payment) async {
    var response = await http.post(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "id_user": payment.idUser,
          "tanggal_sewa": payment.tanggalSewa,
          "tanggal_kembali": payment.tanggalKembali,
          "data": payment.dataItem.map((item) => item.toJSON()).toList(),
        }),
        Uri.parse("${baseUrl}/rent/payment"));
    log(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      dynamic jsonMap = (jsonData as Map<String, dynamic>)['data'];
      PaymentSuccesModel paymentSuccesModel =
          PaymentSuccesModel.getDataFromJSON(jsonMap);
      return paymentSuccesModel;
    } else {
      return null;
    }
  }

  Future<String> updateRent(String order_id) async {
    log(order_id);
    var response = await http.put(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "order_id": order_id,
        }),
        Uri.parse("${baseUrl}/rent/payment"));
    log(response.body.toString());
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      return jsonObject['message'];
    } else {
      return "Error";
    }
  }
}
