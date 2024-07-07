import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:ps_rental_app/data/forum_data.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';
import 'package:ps_rental_app/provider/chat_forum_provider.dart';

class ImageBeforeSendWidget extends StatefulWidget {
  final File imageFile;
  final int idForum;
  final int idUser;
  const ImageBeforeSendWidget(
      {super.key,
      required this.imageFile,
      required this.idForum,
      required this.idUser});

  @override
  State<ImageBeforeSendWidget> createState() => _ImageBeforeSendWidgetState();
}

class _ImageBeforeSendWidgetState extends State<ImageBeforeSendWidget> {
  late IO.Socket socket;
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
  void initState() {
    super.initState();
    initializeSocket();
  }

  void initializeSocket() {
    socket = IO.io('https://rentconsoleapi.yudho.online', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();

    socket.onConnect((_) {
      log('Connected to the server');
      socket.emit('msg', 'Hello from Flutter');
    });

    socket.onDisconnect((_) {
      log('Disconnected from the server');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Send Image",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: getWidth(),
        height: getHeight(),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: FileImage(widget.imageFile))),
      ),
      bottomSheet: Container(
        width: getWidth(),
        height: getHeight() * 0.08,
        color: Colors.black,
        child: Row(
          children: [
            Consumer<ChatForumProvider>(builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    child: TextFormField(
                      controller: provider.etGambar,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Insert Message",
                          hintStyle: GoogleFonts.poppins(color: Colors.black)),
                    ),
                  ),
                ),
              );
            }),
            Expanded(child: Container(
              child: Center(
                child: Consumer<ChatForumProvider>(
                    builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return IconButton(
                        onPressed: () async {
                          provider.loading();
                          String dataImage = await ForumData()
                              .uploadImage(provider.fileImage!);
                          socket.emit(
                              "sendMessage",
                              ChatForumModel(
                                      avatar: '',
                                      idChat: 0,
                                      idForum: widget.idForum,
                                      idUser: widget.idUser,
                                      image: dataImage,
                                      message: provider.etGambar.text,
                                      name: '',
                                      sendAt: '',
                                      type: 'text')
                                  .toJSON());
                          provider.resetText();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ));
                  }
                }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
