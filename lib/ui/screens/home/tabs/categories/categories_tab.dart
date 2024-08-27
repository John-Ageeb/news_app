import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';

import 'app_category.dart';

class CategoriesTab extends StatelessWidget {
  Function onCategoryClick;

  CategoriesTab(this.onCategoryClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
              "Pick your category "
              "of interest",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff4F5A69),
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: GridView.builder(
                itemCount: CategoryDM.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        return onCategoryClick(
                            CategoryDM.categoriesList[index]);
                      },
                      child: AppCategory(
                          categoryDM: CategoryDM.categoriesList[index]));
                }),
          ),
        )
      ],
    );
  }
}
