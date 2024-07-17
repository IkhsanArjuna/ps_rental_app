class UserModel {
  final int idUser;
  String name;
  final String email;
  String avatar;
  final String role;
  final int rentCount;
  final int bookmarkCount;

  UserModel(
      {required this.avatar,
      required this.bookmarkCount,
      required this.email,
      required this.idUser,
      required this.name,
      required this.rentCount,
      required this.role});

  factory UserModel.getDataFromJSON(Map<String, dynamic> json) {
    return UserModel(
        avatar: json['avatar'] ?? '',
        bookmarkCount: json['bookmark'] ?? 0,
        email: json['email'] ?? '',
        idUser: json['id_user'] ?? 0,
        name: json['name'] ?? '',
        rentCount: json['rent'] ?? 0,
        role: json['role'] ?? '');
  }

  Map<String, dynamic> toJSON() {
    return {
      "id_user": idUser,
      "name": name,
      "email": email,
      "avatar": avatar,
      "role": role,
      "rent": rentCount,
      "bookmark": bookmarkCount
    };
  }
}
