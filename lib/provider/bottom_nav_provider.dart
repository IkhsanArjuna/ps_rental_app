import 'package:flutter/material.dart';
import 'package:ps_rental_app/view/widget/home_widget.dart';
import 'package:ps_rental_app/view/widget/profile_widget.dart';
import 'package:ps_rental_app/view/widget/status_widget.dart';

class BottomNavProvider extends ChangeNotifier {
  List<Widget> menuItem = [
    const HomeWidget(listimage: [
   "https://i.ytimg.com/vi/NmgOWKQj5-Y/maxresdefault.jpg",
    "https://www.billboard.com/wp-content/uploads/2024/06/PS5-Slim-Getty-Hero.jpg?w=942&h=623&crop=1",
    "https://selular.id/wp-content/uploads/2019/09/playstation-5.jpeg",
    "https://images.everyeye.it/img-notizie/non-ps5-playstation-4-riceve-aggiornamento-novitA-v4-670948.jpg"
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
