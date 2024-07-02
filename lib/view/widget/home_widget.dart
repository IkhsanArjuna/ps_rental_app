import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/data/forum_data.dart';
import 'package:ps_rental_app/models/forum_model.dart';
import 'package:ps_rental_app/view/page/forum_detail_page.dart';
import 'package:ps_rental_app/view/widget/menu_item_widget.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.listimage,
  });

  final List<String> listimage;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int indexC = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {},
              enlargeCenterPage: true,
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.3),
          items: widget.listimage.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(i), fit: BoxFit.fill)),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text("Sewa apa hari ini?"),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Color.fromRGBO(19, 26, 42, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItemWidget(
                        name: "PS 5",
                      ),
                      MenuItemWidget(
                        name: "PS 4",
                      ),
                      MenuItemWidget(
                        name: "PS 3",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MenuItemWidget(
                          name: "Xbox",
                        ),
                        MenuItemWidget(
                          name: "Handheld",
                        ),
                        MenuItemWidget(
                          name: "AddOn",
                        ),
                      ],
                    ),
                    color: Color.fromRGBO(19, 26, 42, 1),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.32,
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Color.fromRGBO(19, 26, 42, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FORUM",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Lainnya",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ))
                    ],
                  ),
                ),
                FutureBuilder(
                    future: ForumData().getALlForum(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.data!.isEmpty) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                            child: Text(
                              "No Forum Yet",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        );
                      } else {
                        List<ForumModel> forumData = (snapshot.data!);
                        return Expanded(
                          child: Container(
                            color: Color.fromRGBO(19, 26, 42, 1),
                            child: ListView.builder(
                              itemCount: forumData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForumDetailPage(
                                                forumModel: forumData[index],
                                              ),
                                        )),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: forumData[index]
                                                                .image ==
                                                            ''
                                                        ? NetworkImage(
                                                            "https://asset.kompas.com/crops/hXNsF__b81HEedTs7CMy4ujjGhg=/121x60:1894x1242/750x500/data/photo/2022/06/29/62bc1de39ef4c.jpg")
                                                        : NetworkImage(
                                                            forumData[index]
                                                                .image),
                                                    fit: BoxFit.cover),
                                                color: Color.fromRGBO(
                                                    217, 217, 217, 1),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                )),
                                          ),
                                          Expanded(
                                              child: Center(
                                            child: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              forumData[index].name,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}