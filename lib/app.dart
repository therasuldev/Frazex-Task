import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frazex_task/core/app/intl.dart';
import 'package:frazex_task/core/provider/app_bloc/app_bloc.dart';
import 'package:frazex_task/core/repository/repository.dart';
import 'package:frazex_task/core/repository/search_repository.dart';
import 'package:frazex_task/view/home/home_page.dart';
import 'package:frazex_task/view/widget/widgets.dart';

import 'core/provider/lang_cubit/lang_cubit.dart';
import 'core/provider/search_bloc/search_bloc.dart';

class MyApp extends NewsStatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppBloc(repository: NewsRepository())),
        BlocProvider(
            create: (context) =>
                SearchBloc(searchRepository: SearchRepositoryImpl())),
        BlocProvider(create: (context) => LangCubit()..initApp()),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Frazex Task - News app',
            localizationsDelegates: [
              news.intl.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: languages.map((lang) => Locale(lang, '')),
            locale: Locale(state.langCode ?? news.intl.locale.languageCode),
            home: NewsApp(),
          );
        },
      ),
    );
  }
}
