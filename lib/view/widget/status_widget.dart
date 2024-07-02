import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/rent_data.dart';
import 'package:ps_rental_app/models/rent_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      if (provider.userLoginNow == null) {
        return Center(
          child: Text(
            "Auth Failed",
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        );
      } else {
        return FutureBuilder(
            future: RentData().getAllRentById(provider.userLoginNow!.idUser),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "User Doestn Have Active Rent",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                );
              } else {
                List<RentModel> allRent = (snapshot.data!);

                return ListView.builder(
                  itemCount: allRent.length,
                  itemBuilder: (context, index) {
                    Duration durasi = DateFormat('yyyy-MM-DD')
                        .parse(allRent[index].tanggalKembali)
                        .difference(DateFormat('yyyy-MM-DD')
                            .parse(allRent[index].tanggalSewa));
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(
                            color: allRent[index].status == 'approve'
                                ? Colors.blue
                                : Color.fromRGBO(104, 120, 140, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.06,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      allRent[index].itemRents[0].name,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      "Lama Peminjaman: ${durasi.inDays} days ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                    Text(
                                      "Sisa Waktu: 3 Hari ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                    Text(
                                      "StatusWidget: ${allRent[index].status} ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            });
      }
    });
  }
}
