import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frazex_task/core/repository/repository.dart';

import '../../model/news_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final NewsRepository repository;
  AppBloc({required this.repository}) : super(Empty()) {
    on<GetPageEvent>(_onGetPageEvent);
  }
  _onGetPageEvent(GetPageEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      final resp = await repository.getNews(event.category);
      final news = resp.map<NewsModel>((e) => NewsModel.fromJson(e)).toList();
      emit(Success(model: news));
    } catch (e) {
      log(e.toString());
    }
  }

}
