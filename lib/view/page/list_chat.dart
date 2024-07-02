import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ListChatPage extends StatelessWidget {
  const ListChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
       leading:IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
      
       title: Text("CHAT",style: GoogleFonts.poppins(
        fontSize: 16,color: Colors.white)),
      ),
    );
    
  }
}