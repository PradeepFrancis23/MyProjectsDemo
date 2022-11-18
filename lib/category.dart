import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/newsModels.dart';
import 'package:http/http.dart';

class CategoryNews extends StatefulWidget {
  // const CategoryNews({super.key});
  String Query;
  CategoryNews({required this.Query});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  bool isLoading = true;
  getNewsByQuery(String query) async {
    String url = '';
    if (query == "National") {
      url =
          "https://newsapi.org/v2/everything?q=jammu&from=2022-10-17&sortBy=publishedAt&apiKey=f36a0abbfbf9431fbed625784b7ead93";
    } else if (query == "Business") {
      url =
          "https://newsapi.org/v2/everything?q=bus&from=2022-10-17&sortBy=publishedAt&apiKey=f36a0abbfbf9431fbed625784b7ead93";
    } else if (query == "Sports") {
      url =
          "https://newsapi.org/v2/everything?q=sports&from=2022-10-17&sortBy=publishedAt&apiKey=f36a0abbfbf9431fbed625784b7ead93";
    } else {
      url =
          "https://newsapi.org/v2/everything?q=tamil&from=2022-11-16&to=2022-11-16&sortBy=popularity&apiKey=f36a0abbfbf9431fbed625784b7ead93";
    }

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.Query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.Query,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsModelList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 1.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    newsModelList[index].newsImg,
                                    fit: BoxFit.fitHeight,
                                    height: 230,
                                    width: double.infinity,
                                  )),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black12.withOpacity(0),
                                            Colors.black
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                  padding: EdgeInsets.fromLTRB(15, 15, 10, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsModelList[index].newsHead,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        newsModelList[index].newsDes.length > 50
                                            ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                            : newsModelList[index].newsDes,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("SHOW MORE")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
