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
            padding:  EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.03,
              vertical: MediaQuery.of(context).size.height*0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              color: Color.fromARGB(14, 19 ,31, 1),
              child: Column(
                children: [
                  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              color:Color.fromRGBO(14, 19, 31, 1),

              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:
                 CrossAxisAlignment.start,
                 children: [
                  Text("Pilih Durasi: ",style: GoogleFonts.poppins(
                        color:Colors.white ,fontSize: 12, fontWeight: FontWeight.bold),),
                  Text("Durasi Peminjaman",style: GoogleFonts.poppins(
                        color:Colors.white ,fontSize: 12),),
                 ],

                
                
              ),
              
            
                  ),
                  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
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
          Container(
             width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              
            ),

          )

        ],
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
      padding:  EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width*0.03,
                  vertical: MediaQuery.of(context).size.height*0.01,
    
      ),
      child: Container(
      width: MediaQuery.of(context).size.width*0.13,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color:Color.fromRGBO(217, 217, 217, 1),
        borderRadius:BorderRadius.all(Radius.circular(15)) ),
      child: Center(
        child: Text(name,style: GoogleFonts.poppins(
          color:Colors.black ,fontSize: 12,fontWeight: FontWeight.bold),), 
      ),
                    )
    );
  }
}
