import 'package:flutter/material.dart';
import 'package:news_app/data/apis_manager.dart';
import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/sources_response.dart';

import '../../../../widgets/error_view.dart';
import '../../../../widgets/loading_view.dart';

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
        itemBuilder: (context, index) => mapArticalToWidget(articles[index]));
  }

  mapArticalToWidget(Articles article) {
    return Column(
      children: [
        Image.network(article.urlToImage ?? ""),
        Text(article.source!.name ?? ""),
        Text(article.title!),
        Text(article.publishedAt!),
      ],
    );
  }
}
