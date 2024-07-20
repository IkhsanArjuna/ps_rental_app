import 'package:flutter/material.dart';
import 'package:ps_rental_app/view/widget/home_widget.dart';
import 'package:ps_rental_app/view/widget/profile_widget.dart';
import 'package:ps_rental_app/view/widget/status_widget.dart';

class BottomNavProvider extends ChangeNotifier {
  List<Widget> menuItem = [
    const HomeWidget(listimage: [
   "https://i.pinimg.com/originals/9e/9f/9c/9e9f9c9f88e4c737590d37c344963cdb.jpg",
    "https://i.pinimg.com/736x/5a/c8/41/5ac841b712c99732f052ac9c109964c2.jpg",
    "https://media.istockphoto.com/id/1094792720/id/foto/warna-tekstur-kuning-cerah-latar-belakang-wallpaper-kuning.jpg?s=170667a&w=0&k=20&c=Cfo5dbE2t6j_8GTOpw-WjemfVxIX1B6c68Mb2HRdeiM=",
    "https://e1.pxfuel.com/desktop-wallpaper/969/587/desktop-wallpaper-warna-polos-gambar-warna-ungu.jpg"
  ]),
    const StatusWidget(),
    const ProfileWidget()
  ];
  int index = 0;

  void changeMenu(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
