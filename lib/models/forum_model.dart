class ForumModel {
  final int idForum;
  final String name;
  final String image;
  final String deskripsi;
  final String lastMessage;
  final String create_at;

  ForumModel(
      {required this.idForum,
      required this.name,
      required this.image,
      required this.deskripsi,
      required this.create_at,
      required this.lastMessage});
  factory ForumModel.getDataFromJSON(Map<String, dynamic> json) {
    return ForumModel(
        idForum: json['id_forum'] ?? 0,
        name: json['name'] ?? '',
        image: json['image'] ?? '',
        deskripsi: json['deskripsi'] ?? '',
        create_at: json['create_at'] ?? '',
        lastMessage: json['last_message'] ?? '');
  }
}
