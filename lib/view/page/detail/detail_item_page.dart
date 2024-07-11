import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({super.key});

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
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://web.kominfo.go.id/sites/default/files/kominfo-dirjen-aptika-semuel-semmy-DRA-3.jpeg'))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp.250.000",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PS5 ULtimate Game Experience",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              color: Color.fromARGB(14, 19, 31, 1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pilih Durasi: ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Durasi Peminjaman",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DurasiPinjam(
                          name: "1D",
                        ),
                        DurasiPinjam(
                          name: "3D",
                        ),
                        DurasiPinjam(
                          name: "5D",
                        ),
                        DurasiPinjam(
                          name: "1W",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Produk ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                      Container(

                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height ,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child:  Text(
                          "Zona ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,),
                        )
,

                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height ,
                                            color: Color.fromRGBO(14, 19, 31, 1),
                          child:  Text(
                          "Playstation 5 ",
                          style: GoogleFonts.poppins(
                              color: Colors.blue,
                              fontSize: 13,),
                        ) 
                          
                        ),
                      )
                      
                     ],
                    ),
                    

                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.03,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Text(
                          "Deskripsi Produk ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ) ,
              
            ),
          ),
          Container(  
             width: MediaQuery.of(context).size.width * 0.4,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
                child:Text(
                          "Paket rental PS5 Ultimate Game Experience memberikan Anda kesempatan untuk menikmati berbagai game populer dengan satu paket lengkap. Dirancang untuk gamer yang ingin merasakan variasi permainan terbaik, paket ini mencakup tiga game top yang akan memberikan hiburan tanpa henti. Dengan durasi sewa yang fleksibel, Anda dapat menikmati game-game ini dengan nyaman sesuai dengan jadwal Anda.Fitur Paket:Konsol PlayStation 5 (PS5)Konsol gaming terbaru dari Sony dengan performa superior.Mendukung resolusi hingga 4K dengan frame rate tinggi.Tiga Game PopulerSpider-Man: Miles MoralesJelajahi kota New York sebagai Spider-Man baru dengan kekuatan dan cerita unik.Grafis dan animasi yang memukau, serta gameplay yang dinamis.Horizon Forbidden WestPetualangan epik di dunia post-apocalyptic dengan karakter utama Aloy.Dunia terbuka yang luas dengan berbagai misi dan aktivitas.FIFA 23Pengalaman bermain sepak bola yang realistis dengan berbagai mode permainan.Update terbaru tim, pemain, dan fitur-fitur inovatif dalam permainan.Durasi Sewa FleksibelTersedia pilihan durasi sewa mulai dari 3 hari, 1 minggu, hingga 2 minggu.Durasi sewa yang lebih panjang memberikan nilai lebih dengan biaya yang lebih ekonomis.",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15),
                        ), 
          )
        ],

      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.06,
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                 horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height,
                      color: Color.fromRGBO(14, 19, 31, 1),
                      child: Center(
                        child: IconButton(onPressed: () {},
              icon: Icon(Icons.message_outlined),
              color: Colors.white,),
                      ),
              
              
              ),
            ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.01,

          ),
          child: Container(
          width: MediaQuery.of(context).size.width*0.4,
          height: MediaQuery.of(context).size.height,
        
          
          child: ElevatedButton(
          
            style: ButtonStyle(
              side: WidgetStatePropertyAll(BorderSide(color: Colors.blue,
              width:2 )),
              backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(14, 19, 31, 1)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5),
                )))
            ),
          onPressed: () {},
           child: Text(
            "Sewa Langsung",style: GoogleFonts.poppins
            (fontSize: 12,color: Colors.blue),
            
           )),
          
          
          
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
          
              child: ElevatedButton(
                style: ButtonStyle(
                  side: WidgetStatePropertyAll(BorderSide(color: Colors.blue,
              width:2 )),
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5),
                )))
                ),
                
                onPressed:(){}, 
              child:Text(
            "+Keranjang",style: GoogleFonts.poppins
            (fontSize: 12,color: Colors.white),
             )
              )
            ),
          ),
        )
        
          ],

        ),
        
      ),
    );
  }
}

class DurasiPinjam extends StatelessWidget {
  final String name;

  const DurasiPinjam({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.13,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
