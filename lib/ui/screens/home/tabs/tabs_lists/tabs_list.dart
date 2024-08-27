import 'package:flutter/material.dart';
import 'package:news_app/data/apis_manager.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/ui/screens/home/tabs/tabs_lists/news_list.dart';
import 'package:news_app/utilites/app_colors.dart';
import 'package:news_app/widgets/error_view.dart';
import 'package:news_app/widgets/loading_view.dart';

class TabsList extends StatefulWidget {
  String categoryId;
  String? searchContant;

  TabsList(this.categoryId, {super.key, this.searchContant});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApisManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error.toString(),
              onRetryCkick: () {},
            );
          } else if (snapshot.hasData) {
            return buildTabsList(snapshot.data!.sources!);
          } else {
            return LoadingView();
          }
        });
  }

  Widget mapSourceToTab(Source source, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColor.primary, width: 3),
        color: isSelected ? AppColor.primary : Colors.white,
      ),
      child: Text(source.name ?? "",
          style:
              TextStyle(color: isSelected ? Colors.white : AppColor.primary)),
    );
  }

  Widget buildTabsList(List<Source> sources) {
    List<Widget> tabs = sources
        .map((source) =>
            mapSourceToTab(source, selectedTabIndex == sources.indexOf(source)))
        .toList();
    List<Widget> tabsBody = sources
        .map((sources) => NewsList(
              source: sources,
            ))
        .toList();

    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          TabBar(
            tabs: tabs,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
          ),
          Expanded(
            child: TabBarView(
              children: tabsBody,
            ),
          )
        ],
      ),
    );
  }
}
