import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/apis_manager.dart';
import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/utilites/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../widgets/error_view.dart';
import '../../../../../widgets/loading_view.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleResponse>(
        future: ApisManager.getArtical(source.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error.toString(),
              onRetryCkick: () {},
            );
          } else if (snapshot.hasData) {
            return buildNewsList(snapshot.data!.articles);
          } else {
            return LoadingView();
          }
        });
  }

  Widget buildNewsList(List<Articles>? articles) {
    return ListView.builder(
        itemCount: articles!.length,
        itemBuilder: (context, index) =>
            mapArticalToWidget(articles[index], context));
  }

  mapArticalToWidget(Articles article, BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage ?? "",
          placeholder: (context, url) => LoadingView(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: MediaQuery.of(context).size.height * .25,
        ),
        // Image.network(article.urlToImage ?? ""),
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.source!.name ?? "",
                style: TextStyle(color: AppColor.gray),
              ),
            )),
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )),
        Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                convertToRelativeTime(article.publishedAt!),
                style: TextStyle(color: AppColor.gray),
              ),
            )),
      ],
    );
  }

  String convertToRelativeTime(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Convert DateTime to relative time using timeago package
    return timeago.format(dateTime);
  }
}
