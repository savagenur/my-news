import 'package:flutter/material.dart';

import '../models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title!),

      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              // width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage == null
                        ? 'https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'
                        : article.urlToImage!,),
                  ),
                  borderRadius: BorderRadius.circular(8),
                )),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 168, 231, 145),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(article.source!.name!),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.description!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
