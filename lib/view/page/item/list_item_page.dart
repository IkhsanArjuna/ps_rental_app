import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/item_data.dart';
import 'package:ps_rental_app/models/item_model.dart';
import 'package:ps_rental_app/provider/cart_provider.dart';
import 'package:ps_rental_app/provider/converter.dart';
import 'package:ps_rental_app/view/page/cart/cart_page.dart';
import 'package:ps_rental_app/view/page/detail/detail_item_page.dart';

class ListItemPage extends StatelessWidget {
  final String filter;
  const ListItemPage({super.key, required this.filter});

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
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
        body: FutureBuilder(
            future: ItemData().getAllItemFilter(filter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Yet",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                );
              } else {
                List<ItemModel> allItem = snapshot.data!;
                return Consumer<CartProvider>(
                    builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: allItem.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailItemPage(),
                              )),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.23,
                            color: Color.fromRGBO(14, 19, 31, 1),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.018,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.38,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: allItem[index].image == ''
                                                ? NetworkImage(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/PS4-Console-wDS4.jpg/640px-PS4-Console-wDS4.jpg")
                                                : NetworkImage(
                                                    allItem[index].image),
                                            fit: BoxFit.fill),
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    child: Container(
                                      color: Color.fromRGBO(14, 19, 31, 1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            allItem[index].name,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 14),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.07,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.star,
                                                        color: i + 1 <=
                                                                allItem[index]
                                                                    .rating
                                                            ? Color.fromRGBO(
                                                                255, 196, 3, 1)
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01),
                                                  child: Container(
                                                    color: Color.fromRGBO(
                                                        33, 35, 39, 0.68),
                                                    child: Center(
                                                      child: Text(
                                                        "Stock : ${allItem[index].stock}",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ],
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  CurrencyConverter
                                                      .convertToIdr(
                                                          allItem[index].price,
                                                          2),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.004),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    decoration: BoxDecoration(),
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: WidgetStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10)))),
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                    Color.fromRGBO(
                                                                        14,
                                                                        19,
                                                                        31,
                                                                        1)),
                                                            side: WidgetStatePropertyAll(
                                                                BorderSide(
                                                                    color:
                                                                        Color.fromRGBO(47, 128, 237, 1)))),
                                                        onPressed: () {
                                                          provider.addToCart(
                                                              allItem[index]);
                                                        },
                                                        child: Text(
                                                          "Tambah",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 11,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          47,
                                                                          128,
                                                                          237,
                                                                          1)),
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            allItem[index].deskripsi,
                                            style: GoogleFonts.poppins(
                                                height: 1.7,
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              }
            }));
  }
}
