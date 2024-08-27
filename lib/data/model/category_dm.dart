import 'dart:ui';

import 'package:news_app/utilites/app_colors.dart';
import 'package:news_app/utilites/app_images.dart';

class CategoryDM {
  String backEndId;
  String titel;
  String ImagePath;
  bool isLeftSide;
  Color backGroundColor;

  CategoryDM(
      {required this.titel,
      required this.backEndId,
      required this.backGroundColor,
      required this.ImagePath,
      required this.isLeftSide});

  static List<CategoryDM> categoriesList = [
    CategoryDM(
        backEndId: "sports",
        titel: "Sports",
        ImagePath: AppImages.sports,
        isLeftSide: true,
        backGroundColor: AppColor.sports),
    CategoryDM(
        backEndId: "technology",
        titel: "Technology",
        ImagePath: AppImages.politics,
        isLeftSide: false,
        backGroundColor: AppColor.politics),
    CategoryDM(
        backEndId: "health",
        titel: "Health",
        ImagePath: AppImages.health,
        isLeftSide: true,
        backGroundColor: AppColor.health),
    CategoryDM(
        backEndId: "business",
        titel: "Business",
        ImagePath: AppImages.bussines,
        isLeftSide: false,
        backGroundColor: AppColor.business),
    CategoryDM(
        backEndId: "entertainment",
        titel: "Entertainment",
        ImagePath: AppImages.environment,
        isLeftSide: true,
        backGroundColor: AppColor.enviroment),
    CategoryDM(
        backEndId: "science",
        titel: "Science",
        ImagePath: AppImages.science,
        isLeftSide: false,
        backGroundColor: AppColor.science),
  ];
}
