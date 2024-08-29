import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/ui/screens/home/tabs/tabs_lists/news_list.dart';
import 'package:news_app/ui/screens/home/tabs/tabs_lists/tabs_view_model.dart';
import 'package:news_app/utilites/app_colors.dart';
import 'package:news_app/widgets/error_view.dart';
import 'package:news_app/widgets/loading_view.dart';
import 'package:provider/provider.dart';

import '../../../../provider/search_provider.dart';

class TabsList extends StatefulWidget {
  String categoryId;

  TabsList(this.categoryId, {super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int selectedTabIndex = 0;
  late SearchProvider? searchContant;
  TabsViewModel viewModel = TabsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    searchContant = Provider.of(context);
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, _) {
          viewModel = Provider.of(context);
          if (viewModel.sourcesApiState is BaseLoadingState) {
            return LoadingView();
          } else if (viewModel.sourcesApiState is BaseErrorState) {
            String errorMessage =
                (viewModel.sourcesApiState as BaseErrorState).errorMassage;

            return ErrorView(error: errorMessage, onRetryCkick: () {});
          } else {
            List<Source> sources =
                (viewModel.sourcesApiState as BaseSuccessState).data;
            return buildTabsList(sources, searchContant?.searchContant);
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

  Widget buildTabsList(List<Source> sources, String? searchContant) {
    List<Widget> tabs = sources
        .map((source) =>
            mapSourceToTab(source, selectedTabIndex == sources.indexOf(source)))
        .toList();
    List<Widget> tabsBody = sources
        .map((sources) => NewsList(
              source: sources,
            ))
        .toList();
    print("NewsList=$searchContant");
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

// return FutureBuilder<SourcesResponse>(
// future: ApisManager.getSources(widget.categoryId),
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return ErrorView(
// error: snapshot.error.toString(),
// onRetryCkick: () {},
// );
// } else if (snapshot.hasData) {
// return buildTabsList(
// snapshot.data!.sources!, searchContant?.searchContant);
// } else {
// return LoadingView();
// }
// });
