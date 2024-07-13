import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ps_rental_app/models/duration_model.dart';

class SingelProductPaymentProvider extends ChangeNotifier {
  List<DurationModel> durasi = [
    DurationModel(durasi: "1D", value: 1, isPicked: true),
    DurationModel(durasi: "3D", value: 3, isPicked: false),
    DurationModel(durasi: "5D", value: 5, isPicked: false),
    DurationModel(durasi: "1W", value: 7, isPicked: false)
  ];

  DurationModel pickedDuration =
      DurationModel(durasi: "1D", value: 1, isPicked: true);

  void changeDuration(int index) {
    pickedDuration = durasi[index];
    DateTime dateTime =
        DateTime.now().add(Duration(days: pickedDuration.value));

    for (var element in durasi) {
      element.isPicked = false;
    }
    durasi[index].isPicked = true;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateFormatTime = dateFormat.format(dateTime);
    log(dateFormatTime.toString());
    notifyListeners();
  }
}
