import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/models/forum_model.dart';

class ForumChatPage extends StatelessWidget {
  final ForumModel forumModel;
  const ForumChatPage({super.key, required this.forumModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Colors.black.withOpacity(0.5))),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        flexibleSpace: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height,
            color: Colors.blueAccent,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.13,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: forumModel.image == ''
                                    ? NetworkImage(
                                        "https://images8.alphacoders.com/119/1196416.jpg")
                                    : NetworkImage(forumModel.image),
                                fit: BoxFit.cover),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                // ignore: unnecessary_string_interpolations
                                forumModel.name,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 0),
                                  child: Text(forumModel.create_at,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.015,
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: BoxConstraints(
                            maxHeight: double.infinity, minHeight: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              constraints: BoxConstraints(
                                  maxHeight: double.infinity, minHeight: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://images8.alphacoders.com/119/1196416.jpg"),
                                            fit: BoxFit.fill),
                                        color: Colors.greenAccent,
                                        shape: BoxShape.circle),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        "Altera RM",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://c4.wallpaperflare.com/wallpaper/249/176/877/exusiai-arknights-texas-arknights-arknights-anime-clouds-hd-wallpaper-preview.jpg"),
                                            fit: BoxFit.cover),
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8))),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxHeight: double.infinity,
                                        minHeight: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Text("Halo gaes met"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.001,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    child: Text(
                                      "08.15 AM",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey, fontSize: 12),
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                )
              ],
            );
          }, childCount: 1))
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.13,
              height: MediaQuery.of(context).size.height,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  )),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  child: TextFormField(
                    autocorrect: false,
                    enableSuggestions: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.008),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color.fromRGBO(70, 41, 242, 1))),
                              onPressed: () {},
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        )),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class ImageSenderWidget extends StatelessWidget {
  const ImageSenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      color: Colors.amberAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://c4.wallpaperflare.com/wallpaper/578/135/704/video-game-arknights-amiya-arknights-hd-wallpaper-preview.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    topLeft: Radius.circular(8))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: Text(
                "Halo Gaessss",
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "08.15 AM",
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class ReceiverWidget extends StatelessWidget {
  const ReceiverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.17,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images8.alphacoders.com/119/1196416.jpg'),
                          fit: BoxFit.fill),
                      color: Colors.greenAccent,
                      shape: BoxShape.circle),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Altera RM",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: double.infinity,
                      minHeight: MediaQuery.of(context).size.height * 0.04,
                      maxWidth: MediaQuery.of(context).size.width * 0.4,
                      minWidth: 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(0),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.008,
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Text("Halo gaes met malam sdsdsdsdsdsdsdsdsdsd"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    "08.15 AM",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SenderForumWidget extends StatelessWidget {
  const SenderForumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: MediaQuery.of(context).size.height * 0.04,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                  minWidth: 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(70, 41, 242, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.008,
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  "halo Coy",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "08.15 AM",
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
