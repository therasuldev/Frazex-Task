import 'package:flutter/material.dart';

import '../../core/app/news.dart';

abstract class NewsStatelessWidget extends StatelessWidget {
  NewsStatelessWidget({Key? key}) : super(key: key);
  final news = News();
}

abstract class NewsStatefulWidget extends StatefulWidget {
  NewsStatefulWidget({Key? key}) : super(key: key);
  final news = News();
}

abstract class NewsState<B extends NewsStatefulWidget> extends State<B> {
  final news = News();
}
