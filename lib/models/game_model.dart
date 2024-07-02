class GameModel {
  final int idGame;
  final String name;
  final String image;
  final String deskripsi;

  GameModel(
      {required this.deskripsi,
      required this.idGame,
      required this.image,
      required this.name});

  factory GameModel.getDataFromJSON(Map<String, dynamic> json) {
    return GameModel(
        deskripsi: json['deskripsi'] ?? '',
        idGame: json['id_game'] ?? 0,
        image: json['image'] ?? '',
        name: json['name'] ?? '');
  }
}
