import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/bottom_nav_provider.dart';
import 'package:ps_rental_app/view/page/list_item_page.dart';
import 'package:ps_rental_app/view/page/test_page.dart';
import 'package:ps_rental_app/view/widget/Profile.dart';
import 'package:ps_rental_app/view/widget/Status.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int current_index = 0;
  List<String> listimage = [
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
        actions: [
          Consumer<BottomNavProvider>(
            builder: (context, value, child) {
              if (value.index == 1) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.white,
                );
              } else {
                return Container();
              }
            },
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage(),));
            },
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.message_outlined),
            color: Colors.white,
          )
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.009,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height,
            child: Consumer<AuthProvider>(builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Selamat Datang",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  provider.userLoginNow == null
                      ? Text("Auth Error")
                      : Text(
                          provider.userLoginNow!.name,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                ],
              );
            }),
          ),
        ),
        leadingWidth: 200,
      ),
      body: Consumer<BottomNavProvider>(builder: (context, provider, child) {
        return provider.menuItem[provider.index];
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child:
              Consumer<BottomNavProvider>(builder: (context, provider, child) {
            return GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color.fromRGBO(18, 205, 217, 1),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromRGBO(37, 40, 54, 1),
              selectedIndex: provider.index,
              onTabChange: (value) {
                provider.changeMenu(value);
              },
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'Status',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.listimage,
  });

  final List<String> listimage;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int indexC = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  indexC = index;
                });
              },
              enlargeCenterPage: true,
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.3),
          items: widget.listimage.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(i), fit: BoxFit.fill)),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text("Sewa apa hari ini?"),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Color.fromRGBO(19, 26, 42, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItemWidget(
                        name: "PS 5",
                      ),
                      MenuItemWidget(
                        name: "PS 4",
                      ),
                      MenuItemWidget(
                        name: "PS 3",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MenuItemWidget(
                          name: "Xbox",
                        ),
                        MenuItemWidget(
                          name: "Handheld",
                        ),
                        MenuItemWidget(
                          name: "AddOn",
                        ),
                      ],
                    ),
                    color: Color.fromRGBO(19, 26, 42, 1),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.04,
                  color: Color.fromRGBO(19, 26, 42, 1),
                  child: Text(
                    "FORUM",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(19, 26, 42, 1),
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 217, 217, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String name;

  const MenuItemWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListItemPage(),
              ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
              Expanded(
                  child: Center(
                      child: Text(
                name,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
