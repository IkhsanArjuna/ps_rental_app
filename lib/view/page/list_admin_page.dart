import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListAdminPage extends StatelessWidget {
  const ListAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        leading: IconButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromRGBO(43, 113, 207, 1))),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.blueAccent,
        title: Text(
          "List Admin",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.005),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images8.alphacoders.com/119/1196416.jpg"),
                              fit: BoxFit.fill),
                          color: Colors.greenAccent,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Admin All",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Container(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)))),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blueAccent)),
                          onPressed: () {},
                          child: Text(
                            "Add",
                            style: GoogleFonts.poppins(color: Colors.white),
                          )),
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
