import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


class ListItemPage extends StatelessWidget {
  const ListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
    appBar: AppBar(
    backgroundColor: Colors.blue,
    actions: [

      IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
      ),
      IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message_outlined),
            color: Colors.white,
          )
    ],
    
  
    ),
    body: ListView.builder(itemBuilder:(context, index) {
      return Padding(
        padding:  EdgeInsets.symmetric(
           horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          color: Color.fromRGBO(14, 19, 31, 1),

          child: Row(children: [
            Padding(
              padding:  EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.018,
            vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color:Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(14, 19, 31, 1),

                child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("PS5 ULtimate Game Experience",style: GoogleFonts.poppins(
                      color:Colors.white ,fontSize: 12),),
                  Text("Rp 250.000",style: GoogleFonts.poppins(
                      color:Colors.white ,fontSize: 12),),
                  Text("Paket rental PS5 Ultimate Game Experience memberikan Anda kesempatan untuk menikmati berbagai game populer dengan satu paket lengkap. Dirancang untuk gamer yang ingin merasakan variasi permainan terbaik, paket ini mencakup tiga game top yang akan memberikan hiburan tanpa henti. Dengan durasi sewa yang fleksibel, Anda dapat menikmati game-game ini dengan nyaman sesuai dengan jadwal Anda. Daftar game; Spider-Man: Miles Morales, Horizon Forbidden West, FIFA 23",style: GoogleFonts.poppins(
                      color:Colors.white ,fontSize: 6),),
                ],),
                
                
              ),
            )
          ],),
        ),

      );
    },
    
    
    )
    );
  }
}