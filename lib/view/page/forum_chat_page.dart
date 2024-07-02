import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumChatPage extends StatelessWidget {
  const ForumChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 19, 31, 1),
      appBar: AppBar(
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
                                image: const NetworkImage(
                                    "https://images8.alphacoders.com/119/1196416.jpg"),
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
                                "Event Test",
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
                                  child: Text("Active Now",
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
                      padding: const EdgeInsets.all(8.0),
                      child: index % 2 == 0
                          ? ReceiverWidget()
                          : SenderForumWidget(),
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
