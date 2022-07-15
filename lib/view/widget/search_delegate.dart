import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frazex_task/core/provider/search_bloc/search_bloc.dart';
import 'package:frazex_task/view/widget/utils.dart';

class NewsSearchDelegate extends SearchDelegate {
  final SearchBloc searchBloc;
  String? queryString;

  NewsSearchDelegate({required this.searchBloc});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(Search(category: '4', query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const LinearProgressIndicator(color: Colors.black);
        }
        if (state is SearchError) {
          return const Center(child: Text('No Results'));
        }
        if (state is SearchLoaded) {
          if (state.news.isEmpty) {
            return const Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: ViewUtils.newsCard(),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration:
                            ViewUtils.cutFromTop(state.news[index]['image']),
                      ),
                      Container(
                        height: 77,
                        alignment: Alignment.center,
                        decoration: ViewUtils.cutFromBottom(),
                        child: Text(state.news[index]['name'],
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                );
              });
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
