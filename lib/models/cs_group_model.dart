class CsGroupModel {
  final int idCs;
  final List<UserCsModel> users;
  final String lastMessage;
  final String updateAt;

  CsGroupModel(
      {required this.idCs,
      required this.lastMessage,
      required this.updateAt,
      required this.users});

  factory CsGroupModel.getDataFromJSON(Map<String, dynamic> json) {
    return CsGroupModel(
        idCs: json['id_cs'] ?? 0,
        lastMessage: json['last_message'] ?? '',
        updateAt: json['update_at'] ?? '',
        users: List<UserCsModel>.from(
            json['users'].map((x) => UserCsModel.getDataFromJSON(x))));
  }
}

class UserCsModel {
  final int idUser;
  final int idMember;
  final String name;
  final String avatar;

  UserCsModel(
      {required this.avatar,
      required this.idMember,
      required this.idUser,
      required this.name});

  factory UserCsModel.getDataFromJSON(Map<String, dynamic> json) {
    return UserCsModel(
        avatar: json['avatar'] ?? '',
        idMember: json['id_member'] ?? 0,
        idUser: json['id_user'] ?? 0,
        name: json['name'] ?? '');
  }
}
