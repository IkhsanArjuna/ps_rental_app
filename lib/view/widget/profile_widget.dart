import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.1,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQknxrfi2oBJzPW9U9nFmNBvJY5QcdHPHVA3g&s")),
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
                                            child: Center(
                                              child: IconButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content:
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Profile Photos ",
                                                                    style: GoogleFonts.poppins(
                                                                    color: Colors.white,
                                                                    fontSize: 24,)),
                                                                    IconButton(onPressed: (){}, icon:Icon(Icons.delete,color: Colors.white,))
                                                                  ],
                                                                ),
                                              
                                                
                                    Container(
                                    width:MediaQuery.of(context).size.width ,
                                    height: MediaQuery.of(context).size.height *0.1,
                                    color: Colors.amber,
                                    child: 
                                    Row(
                                    children: [
                                      Container(
                                        width:MediaQuery.of(context).size.width*0.15 ,
                                    height: MediaQuery.of(context).size.height *0.8,
                                    color: Colors.purple,
                                    child: 
                                    Column(
                                      children: [
                                        
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
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
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
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Budiono Siregar ",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 24,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("budionosiregar@gmail.com ",
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
                          Text("Logout ",
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 20,
                              ))
                        ],
                      ),
                    )
                  ],
                );
              }
            });
      }
    });
  }
}
