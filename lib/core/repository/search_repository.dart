import 'dart:developer';

import 'package:frazex_task/core/domain/demokrat_az.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

abstract class SearchRepository {
  Future<List<Map<String, dynamic>>> searchNews(String query, String category);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Map<String, dynamic>>> searchNews(
      String query, String category) async {
    var response = await http.get(
      NewsSite.pageUrl(category),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      Document document = parser.parse(response.body);
      List<Element> newsElements = document.querySelectorAll('.ts-post-thumb');
      List<Map<String, dynamic>> newsList = [];

      for (var element in newsElements) {
        Element? name = element.children[0];
        Element? image = element.children[0];
        log(newsList.length.toString());

        newsList.add({
          'name': name.attributes['alt'],
          'image': image.attributes['src'],
        });
      }

      return newsList;
    } else {
      throw Exception('error');
    }
  }
}
