import 'dart:convert';

import 'package:daily_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=aaa07db5780d449886a774850cd5bba2";

  //make http request
  Future<List<Article>> getArticle() async {
    var res = await http.get(Uri.parse(endPointUrl) as Uri);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get article");
    }
  }
}
