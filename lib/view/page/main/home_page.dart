import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/bottom_nav_provider.dart';
import 'package:ps_rental_app/provider/edit_profile_provider.dart';
import 'package:ps_rental_app/view/page/customer_service/list_chat_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int current_index = 0;
  List<String> listimage = [
    "https://i.pinimg.com/originals/9e/9f/9c/9e9f9c9f88e4c737590d37c344963cdb.jpg",
    "https://i.pinimg.com/736x/5a/c8/41/5ac841b712c99732f052ac9c109964c2.jpg",
    "https://media.istockphoto.com/id/1094792720/id/foto/warna-tekstur-kuning-cerah-latar-belakang-wallpaper-kuning.jpg?s=170667a&w=0&k=20&c=Cfo5dbE2t6j_8GTOpw-WjemfVxIX1B6c68Mb2HRdeiM=",
    "https://e1.pxfuel.com/desktop-wallpaper/969/587/desktop-wallpaper-warna-polos-gambar-warna-ungu.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          Consumer<BottomNavProvider>(
            builder: (context,provider,child) {
              return provider.index != 0 ? IconButton(onPressed:() {}, icon: Icon(Icons.search),
              color: Colors.white,
              ) : Container();
            }
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () { },
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
            child: Consumer<EditProfileProvider>(builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Selamat Datang",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  provider.userModel == null
                      ? Text("Auth Error")
                      : Text(
                          provider.userModel!.name,
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

