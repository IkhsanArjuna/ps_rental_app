import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/atas_dasar.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/atas.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Login",
                              style: GoogleFonts.nunito(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(47, 128, 237, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextFormCustomWidget(
                        isInvisible: false,
                        nameField: "Email",
                      ),
                      TextFormCustomWidget(
                        isInvisible: true,
                        nameField: "Password",
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: TextButton(
                                style: ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero)),
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password ?",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(47, 128, 237, 1),
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
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
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bawah.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New Here ?",
                        style: GoogleFonts.nunito(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ));
                          },
                          child: Text(
                            "Register",
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
                  child: ButtonCustomAuthWidget(
                      name: "Login", route: OnboardingPage()),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class TextFormCustomWidget extends StatelessWidget {
  final String nameField;
  final bool isInvisible;
  const TextFormCustomWidget(
      {super.key, required this.isInvisible, required this.nameField});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.04,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  nameField,
                  style: GoogleFonts.nunito(
                      color: Color.fromRGBO(47, 128, 237, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.15),
              child: TextField(
                obscureText: isInvisible,
                style: GoogleFonts.nunito(
                    color: Color.fromRGBO(47, 128, 237, 1), fontSize: 16),
                enableSuggestions: false,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(47, 128, 237, 1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(47, 128, 237, 1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(47, 128, 237, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
