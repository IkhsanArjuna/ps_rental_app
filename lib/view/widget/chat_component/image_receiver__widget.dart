import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';

class ImageReceiverWidget extends StatelessWidget {
  final ChatForumModel chatForumModel;
  const ImageReceiverWidget({super.key, required this.chatForumModel});
  double getWidth() {
    FlutterView view = PlatformDispatcher.instance.views.first;

    double physicalWidth = view.physicalSize.width;

    double devicePixelRatio = view.devicePixelRatio;

    double screenWidth = physicalWidth / devicePixelRatio;
    return screenWidth;
  }

  double getHeight() {
    FlutterView view = PlatformDispatcher.instance.views.first;
    double physicalHeight = view.physicalSize.height;

    double devicePixelRatio = view.devicePixelRatio;
    double screenHeight = physicalHeight / devicePixelRatio;
    return screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(),
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getWidth() * 0.17,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(),
                  height: getHeight() * 0.06,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: chatForumModel.avatar == ''
                              ? NetworkImage(
                                  "https://images8.alphacoders.com/119/1196416.jpg")
                              : NetworkImage(chatForumModel.avatar),
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
                  width: getWidth() * 0.4,
                  height: getHeight() * 0.03,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      chatForumModel.name,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  width: getWidth() * 0.4,
                  height: getHeight() * 0.13,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(chatForumModel.image),
                          fit: BoxFit.cover),
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(8))),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: double.infinity,
                      minHeight: 0,
                      maxWidth: getWidth() * 0.4,
                      minWidth: getWidth() * 0.4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.008,
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: Text(chatForumModel.name),
                  ),
                ),
                SizedBox(
                  height: getHeight() * 0.001,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
                  child: Text(
                    chatForumModel.sendAt,
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}