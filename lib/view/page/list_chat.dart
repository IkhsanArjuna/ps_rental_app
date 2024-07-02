import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ps_rental_app/view/page/list_admin_page.dart';

class ListChatPage extends StatelessWidget {
  const ListChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromRGBO(43, 113, 207, 1))),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        title: Text("CHAT",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListAdminPage(),
                    ));
              },
              icon: Icon(
                Icons.group,
                color: Colors.white,
              ))
        ],
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
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images8.alphacoders.com/119/1196416.jpg"),
                              fit: BoxFit.fill),
                          color: Colors.grey[300],
                          shape: BoxShape.circle),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Admin All",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "Yang mau join turney Fishing Planet join ",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Text(
                                "13 Juni 2024",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        ))
                      ],
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
