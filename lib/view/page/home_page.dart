import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/bottom_nav_provider.dart';
import 'package:ps_rental_app/view/page/list_chat.dart';
import 'package:ps_rental_app/view/page/test_page.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ));
            },
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListChatPage(),
                  ));
            },
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

