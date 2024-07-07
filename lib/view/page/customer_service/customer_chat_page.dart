import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ps_rental_app/data/cs_data.dart';
import 'package:ps_rental_app/models/chat_cs_model.dart';
import 'package:ps_rental_app/models/cs_group_model.dart';
import 'package:ps_rental_app/provider/auth_provider.dart';
import 'package:ps_rental_app/provider/cs_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CustomerChatPage extends StatefulWidget {
  final int idCs;
  final String avatarAnotherUser;
  final String nameAnotherUser;
  final int idMemberAnotherUser;
  final int idAnotherUser;
  final List<UserCsModel> users;
  const CustomerChatPage(
      {super.key,
      required this.avatarAnotherUser,
      required this.idMemberAnotherUser,
      required this.idAnotherUser,
      required this.users,
      required this.idCs,
      required this.nameAnotherUser});

  @override
  State<CustomerChatPage> createState() => _CustomerChatPageState();
}

class _CustomerChatPageState extends State<CustomerChatPage> {
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

    socket.on('newMessageCs', (data) {
      log('New message from server: $data');
      ChatCsModel newChat = ChatCsModel.getDataFromJSON(data);
      if (newChat.idCs == widget.idCs) {
        context.read<CsProvider>().newChat(newChat);
      }
    });
  }

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
        backgroundColor: Colors.blueAccent,
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
                                image: widget.avatarAnotherUser == ''
                                    ? NetworkImage(
                                        "https://images8.alphacoders.com/119/1196416.jpg")
                                    : NetworkImage(widget.avatarAnotherUser),
                                fit: BoxFit.cover),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: getWidth() * 0.4,
                        height: getHeight(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                // ignore: unnecessary_string_interpolations
                                widget.nameAnotherUser,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
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
      body: Consumer<AuthProvider>(builder: (context, providerauth, child) {
        return FutureBuilder(
            future: CsData().getAllChat(widget.idCs),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    "No Chat Yet",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                );
              } else {
                List<ChatCsModel> reversedChat =
                    snapshot.data!.reversed.toList();
                context.read<CsProvider>().initialChat(reversedChat);
                return Consumer<CsProvider>(
                    builder: (context, provider, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (context, index) {
                          return Column(
                            children: [
                              ListView.builder(
                                itemCount: provider.csChatAll.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getWidth() * 0.015,
                                          vertical: getHeight() * 0.01),
                                      child: Builder(builder: (context) {
                                        if (provider.csChatAll[index].idUser ==
                                            providerauth.userLoginNow!.idUser) {
                                          return SenderCsWidget(
                                            message: provider
                                                .csChatAll[index].message,
                                            sendAt: provider
                                                .csChatAll[index].sendAt,
                                          );
                                        } else {
                                          return ReceiverCsWidget(
                                            avatar: provider
                                                .csChatAll[index].avatar,
                                            message: provider
                                                .csChatAll[index].message,
                                            sendAt: provider
                                                .csChatAll[index].sendAt,
                                          );
                                        }
                                      }));
                                },
                              ),
                              SizedBox(
                                height: getHeight() * 0.08,
                              )
                            ],
                          );
                        },
                      ))
                    ],
                  );
                });
              }
            });
      }),
      bottomSheet:
          Consumer<AuthProvider>(builder: (context, providerauth, child) {
        return Container(
          width: getWidth(),
          height: getHeight() * 0.08,
          child: Row(
            children: [
              Container(
                width: getWidth() * 0.13,
                height: getHeight(),
                child:
                    Consumer<CsProvider>(builder: (context, provider, child) {
                  return IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                      ));
                }),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getHeight() * 0.01,
                    horizontal: getWidth() * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
                    child: Consumer<CsProvider>(
                        builder: (context, provider, child) {
                      return TextFormField(
                        controller: provider.etPesan,
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
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Color.fromRGBO(
                                                      70, 41, 242, 1))),
                                      onPressed: () {
                                        provider.loading();
                                        for (var element in widget.users) {
                                          if (element.idUser ==
                                              providerauth
                                                  .userLoginNow!.idUser) {
                                            socket.emit(
                                                "sendMessageCs",
                                                ChatCsModel(
                                                        idCs: widget.idCs,
                                                        idMember:
                                                            element.idMember,
                                                        idUser: element.idUser,
                                                        avatar: '',
                                                        name: '',
                                                        message: provider
                                                            .etPesan.text,
                                                        sendAt: '')
                                                    .toJSON());
                                            provider.resetText();
                                            break;
                                          }
                                        }
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
        );
      }),
    );
  }
}

class ReceiverCsWidget extends StatelessWidget {
  final String avatar;
  final String message;
  final String sendAt;
  const ReceiverCsWidget(
      {super.key,
      required this.avatar,
      required this.message,
      required this.sendAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minHeight: 0, maxHeight: double.infinity),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                image: DecorationImage(
                    image: avatar == ''
                        ? NetworkImage(
                            "https://images8.alphacoders.com/119/1196416.jpg")
                        : NetworkImage(avatar),
                    fit: BoxFit.fill),
                shape: BoxShape.circle),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 0,
                maxHeight: double.infinity,
                maxWidth: MediaQuery.of(context).size.width * 0.5,
                minWidth: 0),
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.06,
                      maxHeight: double.infinity,
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                      minWidth: 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      child: Text(
                        message,
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    sendAt,
                    style: GoogleFonts.poppins(color: Colors.grey),
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

class SenderCsWidget extends StatelessWidget {
  final String message;
  final String sendAt;
  const SenderCsWidget(
      {super.key, required this.message, required this.sendAt});

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
                  message,
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
              sendAt,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
