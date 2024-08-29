import 'package:flutter/material.dart';

import '../../../../../data/model/article_response.dart';

class NewsBody extends StatelessWidget {
  NewsBody(this.articles);

  Articles articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .2,
          child: Image.asset(articles.urlToImage ?? ""),
        ),
      ],
    );
  }
}
