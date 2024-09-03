import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:news_app/ui/screens/home/tabs/tabs_lists/tabs_list.dart';
import 'package:news_app/utilites/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/search_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget currantTab;
  bool IsSearchAppBar = false;
  TextEditingController searchController = TextEditingController();
  late SearchProvider searchContant;
  String catBackEndId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currantTab = CategoriesTab(onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    searchContant = Provider.of(context);

    return SafeArea(
      // to start appbar under mpbil notification bar
      child: WillPopScope(
        // to control defult back button
        onWillPop: () async {
          if (currantTab is CategoriesTab) {
            return false;
          } else {
            currantTab = CategoriesTab(onCategoryClick);
            setState(() {});
            return true;
          }
        },
        child: Scaffold(
          appBar: buildAppBar(),
          body: currantTab,
          drawer: buildDrawer(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
//    if (IsSearchAppBar == false) {
    return AppBar(
        backgroundColor: AppColor.primary,
      title: IsSearchAppBar
          ? TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: InkWell(
                    onTap: () {
                      searchContant.searchContant = "";
                      searchController.text = "";
                      IsSearchAppBar = false;
                      searchContant.notifyListeners();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.close,
                      size: 26,
                      color: AppColor.primary,
                    )),
                suffixIcon: InkWell(
                    onTap: () {
                      searchContant.searchContant = searchController.text;
                      onCategoryClickPlusSearch(
                          searchContant: searchContant.searchContant);
                    },
                    child: Icon(
                      Icons.search,
                      size: 26,
                      color: AppColor.primary,
                    )),
                hintText: 'Search Article',
                hintStyle: TextStyle(
                    color: AppColor.primary.withOpacity(.4), fontSize: 18),
                // Placeholder text
                filled: true,
                // Enable background color
                fillColor: Colors.white,
                // Set background color to white
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                // Padding inside the text field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide.none, // Remove border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide.none, // Remove border when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue, // Border color when focused
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: () {
            IsSearchAppBar = true;
            setState(() {});
          },
          child: Row(
            children: [
              Spacer(),
              Text(
                "News App",
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Icon(
                Icons.search,
                size: 30,
                color: currantTab is CategoriesTab
                    ? AppColor.primary
                    : AppColor.white,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(22),
        )),
        toolbarHeight: MediaQuery.of(context).size.height * .09,
      );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildDrawerHeader(),
          buildDrawerRow(Icons.list, "Categories", () {
            currantTab = CategoriesTab(onCategoryClick);
            Navigator.pop(context);
            setState(() {});
          }),
          buildDrawerRow(Icons.settings, "Settings", () {
            currantTab = SettingTab();
            Navigator.pop(context);

            setState(() {});
          }),
        ],
      ),
    );
  }

  buildDrawerHeader() => Container(
      color: AppColor.primary,
      height: MediaQuery.of(context).size.height * .2,
      child: Center(
        child: Text("NewsApp!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColor.white,
            )),
      ));

  buildDrawerRow(IconData icon, String titel, Function Onclick) {
    return InkWell(
      onTap: () {
        Onclick();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              titel,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM) {
    currantTab = TabsList(
      categoryDM.backEndId,
    );
    String catBackEndId = categoryDM.backEndId;
    print("catBackEndId =  $catBackEndId");
    setState(() {});
  }

  onCategoryClickPlusSearch({String? searchContant}) {
    currantTab = TabsList(
      catBackEndId,
    );
    setState(() {});
  }

  searchFunction() {
    TextField(
      decoration: InputDecoration(
        filled: true,
        // This will fill the text field with the background color
        fillColor: Colors.white,
        // Background color for the text field
        hintText: 'Enter text here',
        // Placeholder text
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        // Padding inside the text field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
          borderSide: BorderSide.none, // Removes the border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // Rounded corners for enabled state
          borderSide: BorderSide.none, // Removes the border for enabled state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // Rounded corners for focused state
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: 2.0, // Border width when focused
          ),
        ),
      ),
    );
    setState(() {});
  }

// onNewsClick(Articles articles) {
//   currantTab = NewsBody(articles);
//   setState(() {});
// }
}
