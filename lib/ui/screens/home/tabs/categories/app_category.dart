import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/utilites/app_colors.dart';

class AppCategory extends StatelessWidget {
  CategoryDM categoryDM;
  Radius radius = Radius.circular(24);

  AppCategory({required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(),
      decoration: BoxDecoration(
        color: categoryDM.backGroundColor,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: !categoryDM.isLeftSide ? Radius.zero : radius,
          bottomRight: categoryDM.isLeftSide ? Radius.zero : radius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryDM.ImagePath,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            categoryDM.titel,
            style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
