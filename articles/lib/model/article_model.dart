class ArticleModel {
  String title, body;
  int userId, id;

  ArticleModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  Map articleToMap() {
    return {
      "title": title,
      "body": body,
      "userId": userId,
      "id": id,
    };
  }
}
