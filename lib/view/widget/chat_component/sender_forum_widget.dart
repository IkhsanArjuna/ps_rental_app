import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';


class SenderForumWidget extends StatelessWidget {
  final ChatForumModel chatForumModel;
  const SenderForumWidget({super.key, required this.chatForumModel});
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity,
                  minHeight: getHeight() * 0.04,
                  maxWidth: getWidth() * 0.5,
                  minWidth: 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(70, 41, 242, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getHeight() * 0.008,
                    horizontal: getWidth() * 0.02),
                child: Text(
                  chatForumModel.message,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
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