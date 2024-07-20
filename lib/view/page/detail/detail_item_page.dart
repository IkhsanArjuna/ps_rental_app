import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/converter.dart';
import 'package:ps_rental_app/provider/single_product_payment_provider.dart';
import 'package:ps_rental_app/view/page/detail/detail_payment_page.dart';

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
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.purple,
              child: 
              Column(
                children: [
                  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.amber,
              child: Column(
                children: [
                  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
              width: MediaQuery.of(context).size.width *0.5,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Text( 
                    "Ulasan",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
                  ),
                   Expanded(child: 
                  Container(
                    color: Colors.green,
                    child:
                     Align( 
                      alignment:Alignment.topRight,
                       child: Text( 
                                           "Lihat Semua",
                                           style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                     ),

                  )),
                 

        
                ],
                

              ),
                    

                  )
                ],
              ),

                    
                  )
                ],
              ),
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
                                          return DetailPaymentPage();
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
