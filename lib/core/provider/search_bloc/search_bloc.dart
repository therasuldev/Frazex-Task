import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:frazex_task/core/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchEmpty()) {
    on<Search>(_onSearch);
  }
  void _onSearch(Search event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoading());
      var news = await searchRepository.searchNews(event.query, event.category);
      emit(SearchLoaded(news: news));
    } catch (e) {
      log(e.toString());
    }
  }
}
