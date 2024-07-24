import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/item_data.dart';
import 'package:ps_rental_app/models/rent_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/rent_detail_review_provider.dart';

class RentDetailPage extends StatefulWidget {
  final RentModel rentItem;
  const RentDetailPage({super.key, required this.rentItem});

  @override
  State<RentDetailPage> createState() => _RentDetailPageState();
}

class _RentDetailPageState extends State<RentDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<RentDetailReviewProvider>().initialItems(widget.rentItem);
  }

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
                      child: Consumer<RentDetailReviewProvider>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.items.length,
                          itemBuilder: (context, index) {
                            Duration durasi = DateFormat('yyyy-MM-DD')
                                .parse(widget.rentItem.tanggalKembali)
                                .difference(DateFormat('yyyy-MM-DD')
                                    .parse(widget.rentItem.tanggalSewa));
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  provider.pickedItemFunct(index);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: provider.items[index].isPicked
                                          ? Colors.blueAccent
                                          : Color.fromRGBO(19, 26, 42, 1)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.015,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Colors.grey,
                                              image: DecorationImage(
                                                  image: provider.items[index]
                                                              .image ==
                                                          ''
                                                      ? NetworkImage(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/PS4-Console-wDS4.jpg/640px-PS4-Console-wDS4.jpg")
                                                      : NetworkImage(provider
                                                          .items[index].image),
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
                                              widget.rentItem.itemRents[index]
                                                  .name,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "${durasi.inDays}D,  Quantity: ${provider.items[index].quantity}",
                                              style: GoogleFonts.poppins(
                                                  color: provider
                                                          .items[index].isPicked
                                                      ? Colors.white
                                                      : Colors.grey),
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
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
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.005),
        child: Consumer<RentDetailReviewProvider>(
            builder: (context, provider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  if (provider.pickedItem == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Silahkan Pilih Item Yang Mau Direview",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )));
                  } else if (await ItemData().getSingleReviewByUserAndItem(
                      context.read<AuthProvider>().userLoginNow!.idUser,
                      provider.pickedItem!.idBarang)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Anda Sudah Review Barang Ini ",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color.fromRGBO(27, 27, 27, 1),
                        duration: Duration(days: 365),
                        content: ReviewComponentSendWidget()));
                  }
                },
                child: Text(
                  "Review",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )),
          );
        }),
      ),
    );
  }
}

class ReviewComponentSendWidget extends StatelessWidget {
  const ReviewComponentSendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RentDetailReviewProvider>(
        builder: (context, provider, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.45,
        color: Color.fromRGBO(27, 27, 27, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                children: [
                  IconButton(
                      iconSize: 32,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                      icon: Icon(
                        Icons.highlight_remove,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.005),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/PS4-Console-wDS4.jpg/640px-PS4-Console-wDS4.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PS5 Ultimate Game Experience",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < provider.stars.length; i++)
                    IconButton(
                        iconSize: 32,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          provider.starsChange(i);
                        },
                        icon: Icon(
                          Icons.star_outlined,
                          color:
                              provider.stars[i] ? Colors.yellow : Colors.grey,
                        ))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color.fromRGBO(103, 109, 117, 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              "Apa Yang Bikin Kamu Puas ?",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.005),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(137, 138, 141, 1))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  child: TextFormField(
                    controller: provider.etReview,
                    style: GoogleFonts.poppins(color: Colors.white),
                    maxLines: 4,
                    decoration: InputDecoration.collapsed(
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        hintText: "Masukkan Review Anda"),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  provider.isLoading
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue)),
                          onPressed: () {},
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue)),
                          onPressed: () async {
                            if (await provider.createReview(context
                                .read<AuthProvider>()
                                .userLoginNow!
                                .idUser)) {
                              Fluttertoast.showToast(msg: "Review Added");
                              ScaffoldMessenger.of(context).clearSnackBars();
                            } else {
                              Fluttertoast.showToast(msg: "Internal Error");
                            }
                          },
                          child: Text(
                            "Kirim",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))
                ],
              ),
            ))
          ],
        ),
      );
    });
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
