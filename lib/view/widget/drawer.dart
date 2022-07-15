import 'package:flutter/material.dart';
import 'package:frazex_task/view/widget/settings.dart';
import 'package:frazex_task/view/widget/widgets.dart';

import '../../constant/color/app_colors.dart';
import '../../constant/route/route.dart';

class NewsDrawer extends NewsStatelessWidget {
  NewsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          _avatar(),
          SizedBox(height: MediaQuery.of(context).padding.top),
          _listTile(context),
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context) {
    return ListTile(
      title: Text(news.fmt(context, 'settings')),
      leading:  Icon(Icons.settings, color: AppColors.grey),
      onTap: () => bTtRoute(context: context, route: Settings(), back: true),
    );
  }

  Widget _avatar() {
    return const CircleAvatar(
      minRadius: 50,
      child: FlutterLogo(size: 45),
    );
  }
}
