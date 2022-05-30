import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_news/models/article_model.dart';

final DateTime dateNow = DateTime.now();
final String date = DateFormat("yyyy-MM-dd").format(DateTime(dateNow.year, dateNow.month, dateNow.day - 2));

class ApiService {
  Future<List<Article>> getArticle(String query) async {
    final endPointUrl =
        'https://newsapi.org/v2/everything?q=$query&from=$date&to=$date&sortBy=popularity&apiKey=a7fbb5b3f3be4e4c950968c0371940b8';
    http.Response response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((e) => Article.fromJson(e)).toList();
      return articles;
    } else {
      throw ("Can't get articles");
    }
  }
}
