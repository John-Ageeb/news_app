import 'package:flutter/material.dart';
import 'package:news_app/utilites/app_images.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.politics),
      ],
    );
  }
}
