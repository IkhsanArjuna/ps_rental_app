import 'package:flutter/material.dart';
import 'package:ps_rental_app/view/page/homepage.dart';
import 'package:ps_rental_app/view/widget/Status.dart';

class BottomNavProvider extends ChangeNotifier {
  List<String> listimageBaru = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkW7mIDoInLW_4pukaDTghF-eT2P_WRxQ1Sg&s",
    "https://i.pinimg.com/736x/b2/cd/4b/b2cd4b8944bd3f9792676ce7eb0ee7a3.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNGIWcxqEBqQbHTcfWO7g_xw0m7ACO6k-CNw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlC3-18OhsXS_r8eAHW-dL_wc3ii5ssr_-8w&s,"
  ];
  List<Widget> menuItem = [
    HomeWidget(listimage: BottomNavProvider().listimageBaru),
    Status(),
   
  ];

}
