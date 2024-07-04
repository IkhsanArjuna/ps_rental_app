class ChatForumModel {
  final int idForum;
  final int idChat;
  final int idUser;
  final String name;
  final String avatar;
  final String message;
  final String image;
  final String type;
  final String sendAt;

  ChatForumModel(
      {required this.avatar,
      required this.idChat,
      required this.idForum,
      required this.idUser,
      required this.image,
      required this.message,
      required this.name,
      required this.sendAt,
      required this.type});

  factory ChatForumModel.getDataFromJSON(Map<String, dynamic> json) {
    return ChatForumModel(
        idForum: json['id_forum'] ?? 0,
        avatar: json['avatar'] ?? '',
        idChat: json['id_chat'] ?? 0,
        idUser: json['id_user'] ?? 0,
        image: json['image'] ?? '',
        message: json['message'] ?? '',
        name: json['name'] ?? '',
        sendAt: json['send_at'] ?? '',
        type: json['type']);
  }

  Map<String, dynamic> toJSON() {
    return {
      "id_forum" : idForum,
      "id_user" : idUser,
      "message" : message,
      "image" : image
    };
  }
}
