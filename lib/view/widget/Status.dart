import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.01,),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              color:Colors.blue ,
              borderRadius: BorderRadius.all(Radius.circular(15),
            )),
            child:Row(children: [
              Padding(
                padding:  EdgeInsets.symmetric( 
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.02,),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                  color:Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                ),
              ),
              Expanded(
                child: Container(
                  
                  decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.all(Radius.circular(15)) 
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PS5 ULtimate Game Experience",style: GoogleFonts.poppins(
                      color:Colors.white ,fontSize: 12),),
                    Text("LamaPeminjaman: 5 Hari ", style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 11),),
                    Text("Sisa Waktu: 3 Hari ", style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 11),),
                    Text("Status: Dipinjam ", style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 11),)

                  ],


                  ),
                  
                
                ),
              )
            ],),
          ),
        );
      },
    );
  }
}
