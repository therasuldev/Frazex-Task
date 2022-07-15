import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frazex_task/core/model/news_model.dart';
import 'package:frazex_task/view/widget/utils.dart';

import '../../core/provider/app_bloc/app_bloc.dart';
import '../widget/widgets.dart';

class Politic extends NewsStatefulWidget {
  Politic({Key? key}) : super(key: key);

  @override
  State<Politic> createState() => _PoliticState();
}

class _PoliticState extends NewsState<Politic> {
  @override
  void initState() {
    BlocProvider.of<AppBloc>(context).add(GetPageEvent(category: '4'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return bodyLoading();
          }
          if (state is Success) {
            return bodySuccess(state);
          }
          if (state is Error) {
            log(state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget bodyLoading() => const LinearProgressIndicator(color: Colors.black);

  Widget bodySuccess(Success state) {
    return ListView.builder(
      itemCount: state.model.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        var model = state.model[index];
        return itemCard(model);
      },
    );
  }

  Widget itemCard(NewsModel model) {
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
            decoration: ViewUtils.cutFromTop(model.image),
          ),
          Container(
            height: 77,
            alignment: Alignment.center,
            decoration: ViewUtils.cutFromBottom(),
            child: Text(
              model.name,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
