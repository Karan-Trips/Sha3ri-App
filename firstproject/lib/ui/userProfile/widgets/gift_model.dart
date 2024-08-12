class GiftModel {
  String id;
  String image;
  String title;

  String price;
  String status;
  String date;
  GiftModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.status,
    required this.date,
  });
}

class TokenModel {
  String date;
  String id;
  String price;
  bool isRecived;
  TokenModel({
    required this.date,
    required this.id,
    required this.price,
    required this.isRecived,
  });
}

class PurchaseTokenModel {
  String image;
  String price;
  String qty;
  PurchaseTokenModel(
      {required this.image, required this.price, required this.qty});
}
