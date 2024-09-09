import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/model/article_response.dart';
import '../../../../../utilites/app_colors.dart';

class NewsBody extends StatelessWidget {
  static String routename = "news_body";

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: buildAppBar(context, article),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              article.urlToImage!,
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .9,
            ), // Container(
            //   height: MediaQuery.of(context).size.height * .2,
            //   child: Image.asset(articles.urlToImage ?? ""),
            // ),
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    article.source!.name ?? "",
                    style: TextStyle(color: AppColor.gray),
                  ),
                )),
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    article.title!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                )),

            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    convertToRelativeTime(article.publishedAt!),
                    style: TextStyle(color: AppColor.gray),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: AlignmentDirectional.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      article.content!,
                      style: TextStyle(color: AppColor.darkGray, fontSize: 16),
                    ),
                  ),
                )),
            Spacer(),
            InkWell(
              onTap: () async {
                return launchInBrowser((article.url!));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View Full Article",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, Articles article) {
//    if (IsSearchAppBar == false) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: Text(
        article.title!,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(22),
      )),
      toolbarHeight: MediaQuery.of(context).size.height * .09,
    );
  }

  String convertToRelativeTime(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Convert DateTime to relative time using timeago package
    return timeago.format(dateTime);
  }

  Future<void> launchInBrowser(String url) async {
    if (!await launch(
      url,
      // mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
