import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage == null
                      ? 'https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'
                      : article.urlToImage!),
                        fit: BoxFit.cover

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
            article.title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    ),
  );
}
