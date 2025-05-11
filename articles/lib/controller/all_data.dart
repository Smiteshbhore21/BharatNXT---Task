import 'dart:convert';
import 'package:articles/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Alldata extends ChangeNotifier {
  List<ArticleModel> alldata = [];

  Alldata();

  Future<void> fetchArticles() async {
    alldata.clear();
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(url);
    List listData = jsonDecode(response.body);
    for (var x in listData) {
      alldata.add(
        ArticleModel(
          title: x['title'],
          body: x['body'],
          userId: x['userId'],
          id: x['id'],
        ),
      );
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    await fetchArticles();
  }
}
