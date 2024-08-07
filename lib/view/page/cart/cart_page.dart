import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/cart_provider.dart';
import 'package:ps_rental_app/provider/converter.dart';
import 'package:ps_rental_app/view/page/detail/detail_item_page.dart';
import 'package:ps_rental_app/view/page/detail/detail_payment_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isClicked = false;
  late CartProvider _cartProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // Defer the clearCartList call to avoid the framework lock issue
    Future.microtask(() {
      _cartProvider.clearCartList();
    });

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().clearCartList();
    context.read<CartProvider>().sortingCart();
  }

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
                        if (provider.cartList[index].isHeader) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.015),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(19, 26, 48, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.blueAccent,
                                    value: provider.cartList[index].isPicked,
                                    onChanged: (value) {
                                      provider.bannerCheckup(
                                          provider.cartList[index].name,
                                          index,
                                          value!);
                                    },
                                  ),
                                  Text(
                                    provider.cartList[index].name,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return CartItemWidget(
                            index: index,
                            provider: provider,
                          );
                        }
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
      bottomSheet: Consumer<CartProvider>(builder: (context, provider, child) {
        return Container(
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
                      value: provider.isAll,
                      onChanged: (value) {
                        provider.checkAllItem(value!);
                      },
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
                                CurrencyConverter.convertToIdr(
                                    provider.totalPrice, 0),
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
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.zero),
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromRGBO(47, 126, 247, 1)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))))),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      duration: Duration(days: 365),
                                      content: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.grey,
                                                    )),
                                                Text(
                                                  "Pilih Durasi",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.07,
                                              child: Consumer<CartProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                return ListView.builder(
                                                  itemCount:
                                                      provider.durasi.length,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                        onTap: () {
                                                          provider
                                                              .changeDuration(
                                                                  index);
                                                        },
                                                        child: DurasiPinjam(
                                                            isPicked: provider
                                                                .durasi[index]
                                                                .isPicked,
                                                            name: provider
                                                                .durasi[index]
                                                                .durasi));
                                                  },
                                                );
                                              })),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    overlayColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.grey),
                                                    shape: WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        12)))),
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            Colors.black)),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                    builder: (context) {
                                                      return DetailPaymentPage(
                                                        durasi: provider.pickedDuration,
                                                        paymentModel: provider.toPaymentDetail(context.read<AuthProvider>().userLoginNow!.idUser),
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                        ],
                                      )));
                            },
                            child: Text(
                              "Sewa (${provider.pickedItemLenght()})",
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
        );
      }),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartProvider provider;
  final int index;
  const CartItemWidget(
      {super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        color: Color.fromRGBO(19, 26, 48, 1),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Checkbox(
                      activeColor: Colors.blueAccent,
                      value: provider.cartList[index].isPicked,
                      onChanged: (value) {
                        provider.changePicked(value!, index);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.58,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/PS4.jpeg")),
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01,
                            ),
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              provider.cartList[index].name,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              children: [
                                for (var i = 0; i < 5; i++)
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                    height: MediaQuery.of(context).size.height,
                                    child: Center(
                                      child: i + 1 <=
                                              provider.cartList[index].rating
                                          ? Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  255, 196, 3, 1),
                                            )
                                          : Icon(
                                              Icons.star,
                                              color: Colors.grey,
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
                                      MediaQuery.of(context).size.width * 0.01,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.005),
                              child: Text(
                                CurrencyConverter.convertToIdr(
                                    provider.cartList[index].price, 2),
                                style: GoogleFonts.poppins(color: Colors.white),
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(47, 128, 237, 1)),
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          provider.cartList[index].quantity == 1
                              ? IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromRGBO(25, 34, 56, 1),
                                          title: Center(
                                              child: Text(
                                            "Hapus Barang ?",
                                            style: GoogleFonts.poppins(
                                                color: Color.fromRGBO(
                                                    47, 128, 237, 1)),
                                          )),
                                          content: Text(
                                            "Product yang kamu pilih akan dihapus dari keranjang ",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Color.fromRGBO(
                                                                    25,
                                                                    34,
                                                                    56,
                                                                    1))),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Batal",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      47,
                                                                      128,
                                                                      237,
                                                                      1)),
                                                    )),
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                Colors
                                                                    .blueAccent)),
                                                    onPressed: () {
                                                      provider
                                                          .deleteItem(index);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Hapus",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    size: 20,
                                    Icons.delete,
                                    color: Colors.white,
                                  ))
                              : IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    provider.decrementQuantity(index);
                                  },
                                  icon: Icon(
                                    size: 20,
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                          Text(
                            provider.cartList[index].quantity.toString(),
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                provider.incrementQuantity(index);
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
  }
}
