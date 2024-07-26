import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/models/duration_model.dart';
import 'package:ps_rental_app/models/payment_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/converter.dart';
import 'package:ps_rental_app/provider/single_product_payment_provider.dart';
import 'package:ps_rental_app/view/page/detail/detail_payment_page.dart';
import 'package:ps_rental_app/view/page/detail/detail_review_page.dart';

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({super.key});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://web.kominfo.go.id/sites/default/files/kominfo-dirjen-aptika-semuel-semmy-DRA-3.jpeg'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp.250.000",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PS5 ULtimate Game Experience",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              color: Color.fromARGB(14, 19, 31, 1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pilih Durasi: ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Durasi Peminjaman",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Consumer<SingelProductPaymentProvider>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.durasi.length,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  provider.changeDuration(index);
                                },
                                child: DurasiPinjam(
                                    isPicked: provider.durasi[index].isPicked,
                                    name: provider.durasi[index].durasi));
                          },
                        );
                      }))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Produk ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.04,
                    color: Color.fromRGBO(14, 19, 31, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height,
                          color: Color.fromRGBO(14, 19, 31, 1),
                          child: Text(
                            "Zona ",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: Color.fromRGBO(14, 19, 31, 1),
                              child: Text(
                                "Playstation 5 ",
                                style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontSize: 13,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.03,
              color: Color.fromRGBO(14, 19, 31, 1),
              child: Text(
                "Deskripsi Produk ",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              constraints:
                  BoxConstraints(maxHeight: double.infinity, minHeight: 0),
              child: Text(
                "Paket rental PS5 Ultimate Game Experience memberikan Anda kesempatan untuk menikmati berbagai game populer dengan satu paket lengkap",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
         maxHeight: double.infinity,
        minHeight: MediaQuery.of(context).size.height * 0.4,
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
            ),
            
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.height,
                                child: Text(
                                  "Ulasan",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: Container(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                            EdgeInsets.zero)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailReviewPage(),
                                          ));
                                    },
                                    child: Text(
                                      "Lihat Semua",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.star_rate_rounded,
                                  size: 35,
                                  color: Colors.yellow,
                                )),
                            Text("5.O",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              child: Text(
                                "10 rating/2 ulasan",
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ReviewCartWidget();
                    
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          )
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height,
                color: Color.fromRGBO(14, 19, 31, 1),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.message_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height,
                child: ElevatedButton(
                    style: ButtonStyle(
                        side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.blue, width: 2)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(14, 19, 31, 1)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )))),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(days: 365),
                          content: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        )),
                                    Text(
                                      "Varian Product",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
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
                                              0.005),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1 Day",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "Stock : 1",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              CurrencyConverter.convertToIdr(
                                                  250000, 0),
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Consumer<SingelProductPaymentProvider>(
                                      builder: (context, provider, child) {
                                    return ListView.builder(
                                      itemCount: provider.durasi.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              provider.changeDuration(index);
                                            },
                                            child: DurasiPinjam(
                                                isPicked: provider
                                                    .durasi[index].isPicked,
                                                name: provider
                                                    .durasi[index].durasi));
                                      },
                                    );
                                  })),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        overlayColor:
                                            WidgetStatePropertyAll(Colors.grey),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)))),
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.black)),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return DetailPaymentPage(
                                            paymentModel: [],
                                            durasi: DurationModel(
                                                durasi: '1D',
                                                value: 1,
                                                isPicked: true),
                                          );
                                        },
                                      ));
                                    },
                                    child: Text(
                                      "Sewa Langsung",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                            ],
                          )));
                    },
                    child: Text(
                      "Sewa Langsung",
                      style:
                          GoogleFonts.poppins(fontSize: 12, color: Colors.blue),
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            side: WidgetStatePropertyAll(
                                BorderSide(color: Colors.blue, width: 2)),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            shape:
                                WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            )))),
                        onPressed: () {},
                        child: Text(
                          "+Keranjang",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewCartWidget extends StatelessWidget {
  const ReviewCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
        minHeight: MediaQuery.of(context).size.height * 0.03,
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(
        children: [
          Container(
           
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03,
                    left: MediaQuery.of(context).size.width*0.03),
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/31bc9252-553c-4ed1-ba82-e37be041cb20/de48tjj-0eac2b94-7693-4cde-9c8e-ed9604898673.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzMxYmM5MjUyLTU1M2MtNGVkMS1iYTgyLWUzN2JlMDQxY2IyMFwvZGU0OHRqai0wZWFjMmI5NC03NjkzLTRjZGUtOWM4ZS1lZDk2MDQ4OTg2NzMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.h7y_AlWzho51OzT3r0UsmlONVPupwM0N76jrkRolDGA"),
                              fit: BoxFit.fill),
                      shape: BoxShape.circle),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Text(
                    "SUMARGO",
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.025,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < 5; i++)
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("1 Minggu lalu",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.grey)),
                  )
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
              minHeight: MediaQuery.of(context).size.height * 0.03,
              maxWidth: MediaQuery.of(context).size.width * 0.95,
              minWidth: MediaQuery.of(context).size.width * 0.95,
            ),
            child: Text(
              "Novel “Dilan Dia adalah Dilanku Tahun 1990” karya Pidi Baiq mengisahkan Milea Adnan Hussain, seorang perempuan yang pindah ke Bandung karena tugas ayahnya sebagai tentara. Milea awalnya menyukai Beni di Jakarta, tetapi setelah pindah, dia tertarik pada Dilan. Kisah cinta mereka berdua menghadapi beberapa kendala, termasuk persaingan dengan mahasiswa ITB bernama Kang Adi dan musuh Milea, Susi.",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class DurasiPinjam extends StatelessWidget {
  final String name;
  final bool isPicked;

  const DurasiPinjam({super.key, required this.name, required this.isPicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.13,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: isPicked
                  ? Colors.blueAccent
                  : Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.poppins(
                  color: isPicked ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
