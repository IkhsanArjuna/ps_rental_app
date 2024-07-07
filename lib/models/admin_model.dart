class AdminModel {
  final int idAdmin;
  final String name;
  final String avatar;

  AdminModel({required this.idAdmin, required this.name, required this.avatar});

  factory AdminModel.getDataFromJSON(Map<String, dynamic> json) {
    return AdminModel(
        idAdmin: json['uid'] ?? 0,
        name: json['name'] ?? '',
        avatar: json['avatar'] ?? '');
  }
}
