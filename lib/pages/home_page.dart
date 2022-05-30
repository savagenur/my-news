import 'package:flutter/material.dart';

import '../components/customListTile.dart';
import '../models/article_model.dart';
import '../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = 'movies';
  ApiService client = ApiService();
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: InkWell(
                        onTap: (() => setState(() {
                              isSearch = !isSearch;
                              query = searchController.text;
                              client.getArticle(query);
                            })),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    suffixIconColor: Colors.black,
                    iconColor: Colors.black),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MyNews",
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ],
              ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(query),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return articles[index] != null
                    ? customListTile(articles[index], context)
                    : Container();
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
