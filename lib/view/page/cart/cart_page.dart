import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/cart_provider.dart';
import 'package:ps_rental_app/provider/converter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        title: Text(
          "Keranjang",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.blueAccent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  Consumer<CartProvider>(builder: (context, provider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.cartList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.12,
                            color: Color.fromRGBO(19, 26, 48, 1),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        child: Checkbox(
                                          activeColor: Colors.blueAccent,
                                          value:
                                              provider.cartList[index].isPicked,
                                          onChanged: (value) {
                                            provider.changePicked(
                                                value!, index);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.58,
                                  height: MediaQuery.of(context).size.height,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.01,
                                                ),
                                                child: Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "PS5 Ultimate Game Experience",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: Row(
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.star,
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    196,
                                                                    3,
                                                                    1),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                      vertical:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.005),
                                                  child: Text(
                                                    CurrencyConverter
                                                        .convertToIdr(25000, 2),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      47, 128, 237, 1)),
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    size: 20,
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  )),
                                              Text(
                                                provider
                                                    .cartList[index].quantity
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    provider.incrementQuantity(
                                                        index);
                                                  },
                                                  icon: Icon(
                                                    size: 20,
                                                    Icons.add,
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
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
        color: Color.fromRGBO(19, 26, 42, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Semua",
                    style: GoogleFonts.poppins(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              constraints:
                  BoxConstraints(minWidth: 0, maxWidth: double.infinity),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.18,
                        maxWidth: double.infinity),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          constraints: BoxConstraints(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.18,
                              maxWidth: double.infinity),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Total",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              CurrencyConverter.convertToIdr(2500000, 0),
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.012),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              backgroundColor: WidgetStatePropertyAll(
                                  Color.fromRGBO(47, 126, 247, 1)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          onPressed: () {},
                          child: Text(
                            "Sewa (1)",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
