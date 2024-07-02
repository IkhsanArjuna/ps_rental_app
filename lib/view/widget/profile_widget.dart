import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/auth_data.dart';
import 'package:ps_rental_app/models/user_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      if (provider.userLoginNow == null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: Text("Auth Failed"))],
        );
      } else {
        return FutureBuilder(
            future: AuthData().getSingleUser(provider.userLoginNow!.idUser),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(child: CircularProgressIndicator())],
                );
              } else if (snapshot.data == null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(child: Text("User Auth Failed"))],
                );
              } else {
                UserModel userNow = snapshot.data!;
                return Column(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: userNow.avatar == ''
                                            ? NetworkImage(
                                                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png")
                                            : NetworkImage(userNow.avatar),
                                        fit: BoxFit.cover),
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Color.fromRGBO(25, 34, 56, 1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userNow.name,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      userNow.email,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            });
      }
    });
  }
}
