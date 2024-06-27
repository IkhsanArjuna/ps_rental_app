

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int current_index = 0 ;
  List<String>listimage=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkW7mIDoInLW_4pukaDTghF-eT2P_WRxQ1Sg&s",
    "https://i.pinimg.com/736x/b2/cd/4b/b2cd4b8944bd3f9792676ce7eb0ee7a3.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNGIWcxqEBqQbHTcfWO7g_xw0m7ACO6k-CNw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlC3-18OhsXS_r8eAHW-dL_wc3ii5ssr_-8w&s,"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [IconButton(onPressed:(){}, icon: Icon(Icons.message),
        ),IconButton(onPressed: (){}, icon: Icon(Icons.shop))],
        leading: Column(children: [Text("Selamat Datang"),
        Text("Pelanggan")],),
        leadingWidth: 200,

      ),
      body: ListView(
        children: [
          CarouselSlider(
      carouselController: CarouselController(
        
      ),
      options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              current_index = index;
            });
          },
          enlargeCenterPage: true,
          autoPlay: true,
          height: MediaQuery.of(context).size.height*0.3),
      items: listimage.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(i), fit: BoxFit.fill)),
            );
          },
        );
      }).toList(),
    )
        ],

      ),
      bottomNavigationBar:SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color.fromRGBO(18, 205, 217, 1),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromRGBO(37, 40, 54, 1),
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ), 
    );
  }
}
