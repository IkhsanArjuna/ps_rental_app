import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/auth_data.dart';
import 'package:ps_rental_app/models/user_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/edit_profile_provider.dart';
import 'package:ps_rental_app/view/page/auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    initSharedPreference();
  }

  void initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

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
                log(userNow.name);
                context
                    .read<EditProfileProvider>()
                    .saveInformationUser(userNow);
                return Consumer<EditProfileProvider>(
                    builder: (context, provider, child) {
                  return provider.isLoading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator())
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: provider.userModel!
                                                              .avatar ==
                                                          ''
                                                      ? NetworkImage(
                                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQknxrfi2oBJzPW9U9nFmNBvJY5QcdHPHVA3g&s")
                                                      : NetworkImage(provider
                                                          .userModel!.avatar)),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                  bottom: 0,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue,
                                                    ),
                                                    child: Center(
                                                      child: IconButton(
                                                          onPressed: () {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      days:
                                                                          365),
                                                              content: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          "Profile Photos ",
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                24,
                                                                          )),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            Icons.highlight_remove,
                                                                            color:
                                                                                Colors.white,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.1,
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.16,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.8,
                                                                          margin:
                                                                              EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01, vertical: MediaQuery.of(context).size.height * 0.005),
                                                                                child: Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: MediaQuery.of(context).size.height * 0.06,
                                                                                    decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                                                                    child: IconButton(
                                                                                        onPressed: () {},
                                                                                        icon: Icon(
                                                                                          Icons.camera_alt_outlined,
                                                                                          size: 28,
                                                                                          color: Colors.black,
                                                                                        ))),
                                                                              ),
                                                                              Text(
                                                                                "Camera",
                                                                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.16,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.8,
                                                                          margin:
                                                                              EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01, vertical: MediaQuery.of(context).size.height * 0.005),
                                                                                child: Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: MediaQuery.of(context).size.height * 0.06,
                                                                                    decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                                                                    child: IconButton(
                                                                                        onPressed: () async {
                                                                                          if (await provider.getImagePath(false)) {
                                                                                            if (await provider.editProfileImage()) {
                                                                                              await context.read<AuthProvider>().saveUserNow(provider.userModel!.idUser);
                                                                                              Fluttertoast.showToast(msg: "Update Success");
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                            } else {
                                                                                              Fluttertoast.showToast(msg: "Error");
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                            }
                                                                                          } else {
                                                                                            Fluttertoast.showToast(msg: "Canceled");
                                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          }
                                                                                        },
                                                                                        icon: Icon(
                                                                                          Icons.photo,
                                                                                          size: 28,
                                                                                          color: Colors.black,
                                                                                        ))),
                                                                              ),
                                                                              Text(
                                                                                "Galery",
                                                                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ));
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.black,
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(provider.userModel!.name,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                    )),
                                                IconButton(
                                                    onPressed: () {
                                                      provider.initialText(
                                                          provider
                                                              .userModel!.name);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          days:
                                                                              365),
                                                                  content:
                                                                      Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Edit Profile Name",
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      TextFormField(
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                Colors.white),
                                                                        cursorColor:
                                                                            Colors.white,
                                                                        decoration: InputDecoration(
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                                                            focusColor: Colors.grey,
                                                                            counterStyle: GoogleFonts.poppins(color: Colors.white),
                                                                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                                                            hintStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                                                                            hintText: "Edit Nama Anda"),
                                                                        controller:
                                                                            provider.etName,
                                                                        maxLength:
                                                                            30,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                              },
                                                                              child: Text(
                                                                                "Cancel",
                                                                                style: GoogleFonts.poppins(color: Colors.white),
                                                                              )),
                                                                          TextButton(
                                                                              onPressed: () async {
                                                                                if (await provider.editProfileName()) {
                                                                                  await context.read<AuthProvider>().saveUserNow(provider.userModel!.idUser);
                                                                                  Fluttertoast.showToast(msg: "Update Success");
                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                } else {
                                                                                  Fluttertoast.showToast(msg: "Update Failed");
                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                "Ok",
                                                                                style: GoogleFonts.poppins(color: Colors.white),
                                                                              ))
                                                                        ],
                                                                      )
                                                                    ],
                                                                  )));
                                                    },
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Colors.blue,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(provider.userModel!.email,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        preferences.setString('token', '');
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ));
                                      },
                                      child: Text(
                                        "Logout",
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueAccent),
                                      ))
                                ],
                              ),
                            )
                          ],
                        );
                });
              }
            });
      }
    });
  }
}
