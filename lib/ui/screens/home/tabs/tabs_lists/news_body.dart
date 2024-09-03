import 'package:flutter/material.dart';

import '../../../../../data/model/article_response.dart';
import '../../../../../utilites/app_colors.dart';

class NewsBody extends StatelessWidget {
  static String routename = "news_body";

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: buildAppBar(context, article),
      body: Column(
        children: [
          Text("22222222222222222222222222222222222"),

          // Container(
          //   height: MediaQuery.of(context).size.height * .2,
          //   child: Image.asset(articles.urlToImage ?? ""),
          // ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, Articles article) {
//    if (IsSearchAppBar == false) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: Text(article.title!),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(22),
      )),
      toolbarHeight: MediaQuery.of(context).size.height * .09,
    );
  }
}
