import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/cs_data.dart';
import 'package:ps_rental_app/models/admin_model.dart';
import 'package:ps_rental_app/provider/cs_provider.dart';
import 'package:ps_rental_app/view/page/list_chat_page.dart';

class ListAdminPage extends StatelessWidget {
  final int idUserNow;
  const ListAdminPage({super.key, required this.idUserNow});

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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListChatPage(),
                  ));
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
      body: FutureBuilder(
          future: CsData().getAllAdmin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No Admin Yet",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              );
            } else {
              List<AdminModel> adminAll = (snapshot.data!);
              return Consumer<CsProvider>(builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: adminAll.length,
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
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.005),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: adminAll[index].avatar == ''
                                            ? NetworkImage(
                                                "https://images8.alphacoders.com/119/1196416.jpg")
                                            : NetworkImage(
                                                adminAll[index].avatar),
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
                                  adminAll[index].name,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Container(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)))),
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.blueAccent)),
                                    onPressed: () async {
                                      if (await CsData()
                                          .createGroupAndFirstMessage(
                                              adminAll[index].name,
                                              idUserNow,
                                              adminAll[index].idAdmin)) {
                                        await provider.refreshGroup(idUserNow);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Group Berhasil Dibuat")));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text("Internal Error")));
                                      }
                                    },
                                    child: Text(
                                      "Add",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )),
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
            }
          }),
    );
  }
}
