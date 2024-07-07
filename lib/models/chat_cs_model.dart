class ChatCsModel {
  final int idCs;
  final int idUser;
  final int idMember;
  final String name;
  final String avatar;
  final String message;
  final String sendAt;

  ChatCsModel(
      {required this.idCs,
      required this.idMember,
      required this.idUser,
      required this.avatar,
      required this.name,
      required this.message,
      required this.sendAt});

  factory ChatCsModel.getDataFromJSON(Map<String, dynamic> json) {
    return ChatCsModel(
        idCs: json['id_cs'] ?? 0,
        avatar: json['avatar'] ?? '',
        name: json['name'] ?? '',
        idMember: json['id_member'] ?? 0,
        idUser: json['id_user'] ?? 0,
        message: json['message'] ?? '',
        sendAt: json['send_at'] ?? '');
  }

  Map<String, dynamic> toJSON() {
    return {
      "id_cs" : idCs,
      "id_member" : idMember,
      "message" : message
    };
  }
}
