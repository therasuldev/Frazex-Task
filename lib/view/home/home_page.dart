import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frazex_task/view/pages/economy.dart';
import 'package:frazex_task/view/pages/politic.dart';

import '../../constant/color/app_colors.dart';
import '../../core/provider/search_bloc/search_bloc.dart';
import '../widget/drawer.dart';
import '../widget/search_delegate.dart';
import '../widget/widgets.dart';

class NewsApp extends NewsStatefulWidget {
  NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends NewsState<NewsApp> {
  int _currentIndex = 0;
  final List<Widget> _changePageView = [Politic(), Economy()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _body(context),
      drawer: NewsDrawer(),
      body: _changePageView.elementAt(_currentIndex),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _body(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      title: _currentIndex == 0
          ? Text(news.fmt(context, 'politics'))
          : Text(news.fmt(context, 'economy')),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            final searchBloc = BlocProvider.of<SearchBloc>(context);
            showSearch(
                context: context,
                delegate: NewsSearchDelegate(searchBloc: searchBloc));
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    final politics = news.fmt(context, 'politics');
    final economy = news.fmt(context, 'economy');
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.pageview), label: politics),
        BottomNavigationBarItem(
            icon: const Icon(Icons.category), label: economy)
      ],
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}
