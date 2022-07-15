import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frazex_task/core/app/news.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/app/intl.dart';
import 'core/service/pref_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final News news = News();

  await Hive.initFlutter();
  await Hive.openBox('preferences');

  news.intl = Intl();
  news.prefService = PrefService();
  news.intl.locale = const Locale('az');
  news.intl.supportedLocales = languages;

  runApp(MyApp());
}
