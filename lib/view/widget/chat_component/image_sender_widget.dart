import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';


class ImageSenderWidget extends StatelessWidget {
  final ChatForumModel chatForumModel;
  const ImageSenderWidget({super.key, required this.chatForumModel});
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: getWidth() * 0.5,
            height: getHeight() * 0.15,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: NetworkImage(chatForumModel.image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    topLeft: Radius.circular(8))),
          ),
          Container(
            width: getWidth() * 0.5,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
              child: Text(
                chatForumModel.message,
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
            child: Text(
              chatForumModel.sendAt,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}