import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/models/cart_item_model.dart';
import 'package:ps_rental_app/models/duration_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/confirmation_payment_provider.dart';
import 'package:ps_rental_app/provider/converter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPaymentPage extends StatelessWidget {
  final List<CartItemModel> paymentModel;
  final DurationModel durasi;

  const DetailPaymentPage(
      {super.key, required this.paymentModel, required this.durasi});

  @override
  Widget build(BuildContext context) {
    context
        .read<ConfirmationPaymentProvider>()
        .initialItemPayment(paymentModel);
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: Text(
          "Detail Payment",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  ListView.builder(
                    itemCount: paymentModel.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          color: Color.fromRGBO(19, 26, 42, 1),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: paymentModel[index].image == ''
                                              ? NetworkImage(
                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/PS4-Console-wDS4.jpg/640px-PS4-Console-wDS4.jpg")
                                              : NetworkImage(
                                                  paymentModel[index].image)),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            paymentModel[index].name,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          child: Row(children: [
                                            for (var i = 0; i < 5; i++)
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.07,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.star,
                                                      color: i + 1 <=
                                                              paymentModel[
                                                                      index]
                                                                  .rating
                                                          ? Color.fromRGBO(
                                                              255, 196, 3, 1)
                                                          : Colors.grey,
                                                    ),
                                                  ))
                                          ])),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            CurrencyConverter.convertToIdr(
                                                paymentModel[index].price, 0),
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        paymentModel[index]
                                                            .quantity
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: Text(
                          "Ringkasan Pembayaran",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      color: Color.fromRGBO(19, 26, 42, 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        child: Builder(builder: (context) {
                          int totalHarga = 0;
                          int allTotal = 0;
                          for (var element in paymentModel) {
                            totalHarga += (element.price * element.quantity);
                          }
                          allTotal = totalHarga * durasi.value;
                          return Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Harga",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Text(
                                        CurrencyConverter.convertToIdr(
                                            totalHarga, 0),
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Detail Sewa",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Text(
                                        "${durasi.value} Hari",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Expanded(
                                  child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Pembayaran",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Text(
                                        CurrencyConverter.convertToIdr(
                                            allTotal, 0),
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              );
            },
          ))
        ],
      ),
      bottomSheet: Consumer<ConfirmationPaymentProvider>(
          builder: (context, provider, child) {
        return provider.paymentSuccesModel == null
            ? PesanBayarButtonWidget(
                durationModel: durasi,
              )
            : Container(
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
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height,
                        color: Color.fromRGBO(14, 19, 31, 1),
                        child: provider.updateLoading
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    padding:
                                        WidgetStatePropertyAll(EdgeInsets.zero),
                                    side: WidgetStatePropertyAll(BorderSide(
                                        color: Colors.blue, width: 2)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(14, 19, 31, 1)),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )))),
                                onPressed: () {},
                                child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ButtonStyle(
                                    padding:
                                        WidgetStatePropertyAll(EdgeInsets.zero),
                                    side: WidgetStatePropertyAll(BorderSide(
                                        color: Colors.blue, width: 2)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(14, 19, 31, 1)),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )))),
                                child: Text("Update",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(47, 128, 237, 1))),
                                onPressed: () async {
                                  if (await provider.updateRent()) {
                                    Fluttertoast.showToast(
                                        msg: provider.message);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: provider.message);
                                  }
                                }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.zero),
                                alignment: Alignment.center,
                                side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.blue, width: 2)),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(14, 19, 31, 1)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                )))),
                            child: Center(
                              child: Text(
                                "Virtual Account",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Color.fromRGBO(47, 128, 237, 1)),
                              ),
                            ),
                            onPressed: () async {
                              if (!await launchUrl(Uri.parse(
                                  'https://simulator.sandbox.midtrans.com/openapi/va/index?bank=bri'))) {
                                throw Exception('Could not launch ');
                              }
                            }),
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
                                    padding:
                                        WidgetStatePropertyAll(EdgeInsets.zero),
                                    side: WidgetStatePropertyAll(BorderSide(
                                        color: Colors.blue, width: 2)),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.blue),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    )))),
                                onPressed: () async {
                                  log(provider.paymentSuccesModel!.paymentUrl);
                                  if (!await launchUrl(Uri.parse(provider
                                      .paymentSuccesModel!.paymentUrl))) {
                                    throw Exception('Could not launch ');
                                  }
                                },
                                child: Text(
                                  "Bayar Sekarang",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.white),
                                ))),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}

class PesanBayarButtonWidget extends StatelessWidget {
  final DurationModel durationModel;
  const PesanBayarButtonWidget({super.key, required this.durationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.005),
        child: Consumer<ConfirmationPaymentProvider>(
            builder: (context, provider, child) {
          return provider.isLoading
              ? ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12))))),
                  onPressed: () {},
                  child: CircularProgressIndicator())
              : ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12))))),
                  onPressed: () async {
                    if (await context
                        .read<ConfirmationPaymentProvider>()
                        .payOrder(
                            context.read<AuthProvider>().userLoginNow!.idUser,
                            durationModel)) {
                      Fluttertoast.showToast(msg: "Success");
                    } else {
                      Fluttertoast.showToast(msg: "False");
                    }
                  },
                  child: Text(
                    "Pesan Dan Bayar Sekarang",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ));
        }),
      ),
    );
  }
}
