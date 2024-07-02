import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/models/forum_model.dart';
import 'package:ps_rental_app/view/page/forum_chat_page.dart';

class ForumDetailPage extends StatelessWidget {
  final ForumModel forumModel;
  const ForumDetailPage({super.key,required this.forumModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Colors.black.withOpacity(0.5))),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: Text(
          "Forum",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      image: DecorationImage(
                          image: forumModel.image == '' ? NetworkImage(
                              "https://cdn.idntimes.com/content-images/community/2019/06/razer-blade-stealth-open-100763052-large-cc6ea3af72b05909709ce04df09aad4f_600x400.jpg") : NetworkImage(forumModel.image),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: forumModel.image == '' ? NetworkImage(
                                "https://cdn.idntimes.com/content-images/community/2019/06/razer-blade-stealth-open-100763052-large-cc6ea3af72b05909709ce04df09aad4f_600x400.jpg") : NetworkImage(forumModel.image),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width,
              constraints:
                  BoxConstraints(maxHeight: double.infinity, minHeight: 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(25, 34, 56, 1),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                        maxHeight: double.infinity, minHeight: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          forumModel.name,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.001),
                    child: Text(
                      "Deskripsi",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.002),
                    child: Text(
                      forumModel.deskripsi,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12), bottom: Radius.circular(0)))),
                backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForumChatPage(forumModel: forumModel,),
                  ));
            },
            child: Text(
              "Mulai Chat",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            )),
      ),
    );
  }
}
