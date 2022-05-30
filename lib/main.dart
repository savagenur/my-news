import 'package:flutter/material.dart';
import 'package:my_news/components/customListTile.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/pages/home_page.dart';
import 'package:my_news/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyNews',
      home: HomePage(),
    );
  }
}

