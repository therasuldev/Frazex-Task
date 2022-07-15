import 'dart:developer';

import 'package:flutter/material.dart';

import '../service/pref_service.dart';
import 'intl.dart';

class News {
  static final News _singleton = News._internal();

  final Map<String, dynamic> instances = {};

  factory News() => _singleton;

  News._internal() {
    log('${runtimeType.toString()} instance created');
  }

  set intl(Intl intl) => instances['intl'] = intl;
  Intl get intl => instances['intl'];

  set prefService(PrefService service) => instances['prefService'] = service;
  PrefService get prefService => instances['prefService'];

  String fmt(BuildContext context, String key, [List? args]) {
    return intl.of(context)?.fmt(key, args) ?? '';
  }
}
