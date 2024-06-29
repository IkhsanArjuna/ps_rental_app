import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';

import 'login_page.dart';
import 'onboarding_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.48,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/atas_dasar.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/atas_tengah.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/atas.png'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Register",
                              style: GoogleFonts.nunito(
                                  color: Color.fromRGBO(47, 128, 237, 1),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                          return TextFormCustomWidget(
                              controller: provider.etNameRegister,
                              isInvisible: false,
                              nameField: "Full Name");
                        }),
                        Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                          return TextFormCustomWidget(
                              controller: provider.etEmailRegister,
                              isInvisible: false,
                              nameField: "Email");
                        }),
                        Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                          return TextFormCustomWidget(
                              controller: provider.etPasswordRegister,
                              isInvisible: true,
                              nameField: "Password");
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bawah.png'), fit: BoxFit.fill)),
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.13,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already Member ?",
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                            style: ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.zero)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.06,
                  right: MediaQuery.of(context).size.width * 0.06,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Consumer<AuthProvider>(
                        builder: (context, provider, child) {
                      if (provider.registerIsLoading) {
                        return ElevatedButton(
                            style: ButtonStyle(
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.white)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)))),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(47, 128, 237, 1))),
                            onPressed: () {
                              log("Loading");
                            },
                            child: Center(
                              child: CircularProgressIndicator(),
                            ));
                      } else {
                        return ElevatedButton(
                            style: ButtonStyle(
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.white)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)))),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(47, 128, 237, 1))),
                            onPressed: () async {
                              await provider.registerUser().then(
                                (value) {
                                  if (value) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return LoginPage();
                                      },
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Internal Error")));
                                  }
                                },
                              );
                            },
                            child: Text(
                              "Register",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ));
                      }
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
