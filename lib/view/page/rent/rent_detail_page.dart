import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ps_rental_app/models/rent_model.dart';
import 'package:ps_rental_app/provider/converter.dart';

class RentDetailPage extends StatefulWidget {
  final RentModel rentItem;
  const RentDetailPage({super.key, required this.rentItem});

  @override
  State<RentDetailPage> createState() => _RentDetailPageState();
}

class _RentDetailPageState extends State<RentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        title: Text(
          "Detail Pesanan",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        children: [
                          Text(
                            "Detail Product",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                        itemCount: widget.rentItem.itemRents.length,
                        itemBuilder: (context, index) {
                          Duration durasi = DateFormat('yyyy-MM-DD')
                              .parse(widget.rentItem.tanggalKembali)
                              .difference(DateFormat('yyyy-MM-DD')
                                  .parse(widget.rentItem.tanggalSewa));
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color.fromRGBO(19, 26, 42, 1)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.015,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: widget
                                                          .rentItem
                                                          .itemRents[index]
                                                          .image ==
                                                      ''
                                                  ? NetworkImage(
                                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/PS4-Console-wDS4.jpg/640px-PS4-Console-wDS4.jpg")
                                                  : NetworkImage(widget.rentItem
                                                      .itemRents[index].image),
                                              fit: BoxFit.fill)),
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.005),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.rentItem.itemRents[index].name,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${durasi.inDays}D ${CurrencyConverter.convertToIdr(20000, 0)}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(19, 26, 42, 1),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Info Pesanan",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Container(
                                child: Column(
                                  children: [
                                    OrderTextWidget(
                                      title: "Id Sewa",
                                      value: widget.rentItem.idTransaksi,
                                    ),
                                    OrderTextWidget(
                                      title: "Tgl Sewa",
                                      value:
                                          "${DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-dd").parse(widget.rentItem.tanggalSewa))} - ${DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-dd").parse(widget.rentItem.tanggalKembali))}",
                                    ),
                                    OrderTextWidget(
                                      title: "Status Pembayaran",
                                      value: widget.rentItem.status,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ))
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
                backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
            onPressed: () {},
            child: Text(
              "Review",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}

class OrderTextWidget extends StatelessWidget {
  final String title;
  final String value;
  const OrderTextWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.007),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: GoogleFonts.poppins(color: Colors.grey),
                )),
          ))
        ],
      ),
    );
  }
}
