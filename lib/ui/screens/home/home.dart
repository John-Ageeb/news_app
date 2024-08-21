import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/tabs_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: TabsList(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("News App"),
      centerTitle: true,
    );
  }
}
