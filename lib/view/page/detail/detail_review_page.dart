import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/detail_item-model.dart';

class DetailReviewPage extends StatelessWidget {
  const DetailReviewPage({super.key, required this.allReview});
  final List<AllReviewModel> allReview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        title: Text(
          "Ulasan",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            color: Colors.white),
        backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      ),
      body: ListView(
        children: [
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
                Text(
                  "5.0",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "/5.0",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.005,
                  ),
                  child: Text(
                    "10 rating/2 ulasan",
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: allReview.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AllReviewWidget(OneReview: allReview[index],);
              })
        ],
      ),
    );
  }
}

class AllReviewWidget extends StatelessWidget {
  const AllReviewWidget({
    super.key,required this.OneReview
  });
  final AllReviewModel OneReview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.005,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
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
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                OneReview.avatar),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Text(
                      OneReview.name,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
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
                OneReview.message,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
