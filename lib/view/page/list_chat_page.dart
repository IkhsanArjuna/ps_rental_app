import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/cs_data.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/cs_provider.dart';
import 'package:ps_rental_app/view/page/customer_chat_page.dart';
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
          Consumer<AuthProvider>(builder: (context, provider, child) {
            return IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListAdminPage(
                          idUserNow: provider.userLoginNow!.idUser,
                        ),
                      ));
                },
                icon: Icon(
                  Icons.group,
                  color: Colors.white,
                ));
          })
        ],
      ),
      body: Consumer<AuthProvider>(builder: (context, providerauth, child) {
        return FutureBuilder(
            future: CsData().getAllGroup(providerauth.userLoginNow!.idUser),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Cs Yet",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                );
              } else {
                context.read<CsProvider>().addAllGroup(snapshot.data!);
                return Consumer<CsProvider>(
                    builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.csGroupFirst.length,
                    itemBuilder: (context, index) {
                      for (var i = 0;
                          i < provider.csGroupFirst[index].users.length;
                          i++) {
                        if (provider.csGroupFirst[index].users[i].idUser !=
                            providerauth.userLoginNow!.idUser) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomerChatPage(
                                        users: provider.csGroupFirst[index].users,
                                        idAnotherUser: provider
                                              .csGroupFirst[index]
                                              .users[i]
                                              .idUser,
                                              idCs: provider.csGroupFirst[index].idCs,
                                          idMemberAnotherUser: provider
                                              .csGroupFirst[index]
                                              .users[i]
                                              .idMember,
                                          avatarAnotherUser: provider
                                              .csGroupFirst[index]
                                              .users[i]
                                              .avatar,
                                          nameAnotherUser: provider
                                              .csGroupFirst[index]
                                              .users[i]
                                              .name),
                                    ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: provider
                                                            .csGroupFirst[index]
                                                            .users[i]
                                                            .avatar ==
                                                        ''
                                                    ? NetworkImage(
                                                        "https://images8.alphacoders.com/119/1196416.jpg")
                                                    : NetworkImage(provider
                                                        .csGroupFirst[index]
                                                        .users[i]
                                                        .avatar),
                                                fit: BoxFit.fill),
                                            color: Colors.grey[300],
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.035,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                provider.csGroupFirst[index]
                                                    .users[i].name,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                provider.csGroupFirst[index]
                                                    .lastMessage,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12),
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.01),
                                                child: Text(
                                                  provider.csGroupFirst[index]
                                                      .updateAt,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 12),
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
                            ),
                          );
                        }
                      }
                      return Container();
                    },
                  );
                });
              }
            });
      }),
    );
  }
}
