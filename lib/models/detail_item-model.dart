
class DetailItemModel {
  final int idItem;
  final String name;
  final String image;
  final String type;
  final String deskripsi;
  final int stock;
  final int price;
  final dynamic rating;
  final List<AllReviewModel> AllReviews;
  final List<AllGameModel> AllGames;

  DetailItemModel({
    required this.idItem,
    required this.name,
    required this.image,
    required this.type,
    required this.deskripsi,
    required this.stock,
    required this.price,
    required this.rating,
    required this.AllReviews,
    required this.AllGames,
  });

  factory DetailItemModel.etDataFROMJSON(Map<String, dynamic> json) {
    return DetailItemModel(
      idItem: json['id_item'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      type: json['type'] ?? '',
      deskripsi: json['deskripsi_barang'] ?? '',
      stock: json['stock'] ?? 0,
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0.0,
      AllReviews: List<AllReviewModel>.from(
          json['all_review'].map((x) => AllReviewModel.getDataFROMJSON(x))),
      AllGames: List<AllGameModel>.from(
          json['all_game'].map((x) => AllGameModel.getDataFROMJSON(x))),
    );
  }
}

class AllReviewModel {
  final int IdReview;
  final int IdUser;
  final String name;
  final String avatar;
  final String Message;
  final dynamic rate;
  final int ReviewAt;

  AllReviewModel({
    required this.IdReview,
    required this.IdUser,
    required this.name,
    required this.avatar,
    required this.Message,
    required this.rate,
    required this.ReviewAt,
  });
  factory AllReviewModel.getDataFROMJSON(Map<String, dynamic> json) {
    return AllReviewModel(
      IdReview: json['id_review'] ?? 0,
      name: json['name'] ?? '',
      IdUser: json['id_user'] ?? '',
      avatar: json['avatar'] ?? '',
      Message: json['message'] ?? '',
      rate: json['rate'] ?? 0,
      ReviewAt: json['review_at'] ?? 0,
    );
  }
}

class AllGameModel {
  final int Id;
  final int IdPsGame;
  final String name;
  final String image;
  final String deskripsi;

  AllGameModel({
    required this.Id,
    required this.IdPsGame,
    required this.name,
    required this.image,
    required this.deskripsi,
  });
  factory AllGameModel.getDataFROMJSON(Map<String, dynamic> json) {
    return AllGameModel(
      Id: json['id'] ?? 0,
      name: json['name'] ?? '',
      IdPsGame: json['id_ps_game'] ?? 0,
      image: json['image'] ?? '',
      deskripsi: json['deskripsi'] ?? '',

    );
  }
}
