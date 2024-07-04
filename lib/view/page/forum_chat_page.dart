import 'dart:developer';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/provider/chat_forum_provider.dart';
import 'package:ps_rental_app/view/page/image_before_send_widget.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_rental_app/data/forum_data.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';
import 'package:ps_rental_app/models/forum_model.dart';
import 'package:ps_rental_app/models/user_model.dart';

class ForumChatPage extends StatefulWidget {
  final ForumModel forumModel;
  final UserModel userModel;
  const ForumChatPage(
      {super.key, required this.forumModel, required this.userModel});

  @override
  State<ForumChatPage> createState() => _ForumChatPageState();
}

class _ForumChatPageState extends State<ForumChatPage> {
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

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
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

    socket.on('newMessage', (data) {
      log('New message from server: $data');
      ChatForumModel newChat = ChatForumModel.getDataFromJSON(data);
      if (newChat.idForum == widget.forumModel.idForum) {
        context.read<ChatForumProvider>().updateChatAwal(newChat);
      }
    });
  }

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
        toolbarHeight: getHeight() * 0.08,
        flexibleSpace: SafeArea(
          child: Container(
            width: getWidth() * 0.2,
            height: getHeight(),
            color: Colors.blueAccent,
            child: Row(
              children: [
                SizedBox(
                  width: getWidth() * 0.13,
                ),
                SizedBox(
                  width: getWidth() * 0.6,
                  height: getHeight(),
                  child: Row(
                    children: [
                      Container(
                        width: getWidth() * 0.2,
                        height: getHeight(),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: widget.forumModel.image == ''
                                    ? NetworkImage(
                                        "https://images8.alphacoders.com/119/1196416.jpg")
                                    : NetworkImage(widget.forumModel.image),
                                fit: BoxFit.cover),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: getWidth() * 0.4,
                        height: getHeight(),
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
                                widget.forumModel.name,
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
                                  child: Text(widget.forumModel.create_at,
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
      body: FutureBuilder(
          future: ForumData().getAllMessageForum(widget.forumModel.idForum),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No Chatting Yet",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              );
            } else {
              List<ChatForumModel> test = (snapshot.data!);
              List<ChatForumModel> chatsList = test.reversed.toList();
              context.read<ChatForumProvider>().addChatAwal(chatsList);
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(
                      children: [
                        Consumer<ChatForumProvider>(
                            builder: (context, provider, child) {
                          return ListView.builder(
                            itemCount: provider.chatAwal.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getWidth() * 0.015,
                                    vertical: getHeight() * 0.01),
                                child: Builder(builder: (context) {
                                  if (provider.chatAwal[index].idUser ==
                                      widget.userModel.idUser) {
                                    if (provider.chatAwal[index].type ==
                                        'text') {
                                      return SenderForumWidget(
                                        chatForumModel:
                                            provider.chatAwal[index],
                                      );
                                    } else {
                                      return ImageSenderWidget(
                                        chatForumModel:
                                            provider.chatAwal[index],
                                      );
                                    }
                                  } else {
                                    if (provider.chatAwal[index].type ==
                                        'text') {
                                      return ReceiverWidget(
                                        chatForumModel:
                                            provider.chatAwal[index],
                                      );
                                    } else {
                                      return ImageReceiverWidget(
                                        chatForumModel:
                                            provider.chatAwal[index],
                                      );
                                    }
                                  }
                                }),
                              );
                            },
                          );
                        }),
                        SizedBox(
                          height: getHeight() * 0.08,
                        )
                      ],
                    );
                  }, childCount: 1))
                ],
              );
            }
          }),
      bottomSheet: Container(
        width: getWidth(),
        height: getHeight() * 0.08,
        child: Row(
          children: [
            Container(
              width: getWidth() * 0.13,
              height: getHeight(),
              child: Consumer<ChatForumProvider>(
                  builder: (context, provider, child) {
                return IconButton(
                    onPressed: () async {
                      if (await provider.getImagePath()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageBeforeSendWidget(
                                imageFile: provider.fileImage!,
                                idForum: widget.forumModel.idForum,
                                idUser: widget.userModel.idUser,
                              ),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Internal Error")));
                      }
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ));
              }),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getHeight() * 0.01, horizontal: getWidth() * 0.01),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
                  child: Consumer<ChatForumProvider>(
                      builder: (context, provider, child) {
                    return TextFormField(
                      controller: provider.etMessage,
                      autocorrect: false,
                      enableSuggestions: false,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.005,
                                vertical: getHeight() * 0.008),
                            child: provider.isLoading
                                ? CircularProgressIndicator()
                                : IconButton(
                                    padding: EdgeInsets.zero,
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color.fromRGBO(70, 41, 242, 1))),
                                    onPressed: () {
                                      provider.loading();
                                      socket.emit(
                                          "sendMessage",
                                          ChatForumModel(
                                                  avatar: '',
                                                  idChat: 0,
                                                  idForum:
                                                      widget.forumModel.idForum,
                                                  idUser:
                                                      widget.userModel.idUser,
                                                  image: '',
                                                  message:
                                                      provider.etMessage.text,
                                                  name: '',
                                                  sendAt: '',
                                                  type: 'text')
                                              .toJSON());
                                      provider.resetText();
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    )),
                          )),
                    );
                  }),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

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

class ReceiverWidget extends StatelessWidget {
  final ChatForumModel chatForumModel;
  const ReceiverWidget({super.key, required this.chatForumModel});
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
              children: [
                Container(
                  width: getWidth(),
                  height: getHeight() * 0.06,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: chatForumModel.avatar == ''
                              ? NetworkImage(
                                  'https://images8.alphacoders.com/119/1196416.jpg')
                              : NetworkImage(chatForumModel.avatar),
                          fit: BoxFit.fill),
                      color: Colors.greenAccent,
                      shape: BoxShape.circle),
                )
              ],
            ),
          ),
          Container(
            width: getWidth() * 0.4,
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(),
                  height: getHeight() * 0.03,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      chatForumModel.name,
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
                      minHeight: getHeight() * 0.04,
                      maxWidth: getWidth() * 0.4,
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
                        vertical: getHeight() * 0.008,
                        horizontal: getWidth() * 0.01),
                    child: Text(chatForumModel.message),
                  ),
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
          )
        ],
      ),
    );
  }
}

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
