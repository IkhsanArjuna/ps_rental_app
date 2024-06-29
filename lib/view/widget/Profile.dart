import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.00,
            vertical: MediaQuery.of(context).size.height * 0.025,
          ),
          child: Container(
            
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
           
            decoration: BoxDecoration(
              color: Color.fromRGBO(25, 34, 56, 1),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Container(
                
              width: MediaQuery.of(context).size.width*0.45,
              height: MediaQuery.of(context).size.height ,
              decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),

                shape: BoxShape.circle
              ),
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(25, 34, 56, 1),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Ikhsan Arjuna",style: GoogleFonts.poppins(
                      color:Colors.white ,fontSize: 15),),
                 Text("arjunayuharsyah@gmail.com",style: GoogleFonts.poppins(
                 color:Colors.white ,fontSize: 12),),
                      
                ],),
                

                
              ),
            )
          ],),
          ),
        ),
        
      ],

    );
  }
}