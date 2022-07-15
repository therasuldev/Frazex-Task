import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frazex_task/view/widget/pop_up_menu_bar.dart';
import 'package:frazex_task/view/widget/utils.dart';
import 'package:frazex_task/view/widget/widgets.dart';

import '../../constant/color/app_colors.dart';
import '../../core/provider/lang_cubit/lang_cubit.dart';

class Settings extends NewsStatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends NewsState<Settings> {
  late LangCubit langCubit;

  @override
  void initState() {
    langCubit = BlocProvider.of<LangCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              BlocBuilder<LangCubit, LangState>(
                builder: (context, state) {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: ViewUtils.settingsCard(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.greenAccent),
                          child: const Icon(Icons.language),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          news.fmt(context, 'app.lang'),
                          style: const TextStyle(fontSize: 16),
                        ),
                        Expanded(child: Container()),
                        PopUpMenuBar(
                          baseIcon: Icons.select_all,
                          iconColor: AppColors.blueGrey,
                          items: [
                            PopUpMenuBarItem(
                              title: news.fmt(context, 'lang.az'),
                              tralling: const Text(
                                '🇦🇿',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            PopUpMenuBarItem(
                              title: news.fmt(context, 'lang.ru'),
                              tralling: const Text(
                                '🇷🇺',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                          onSelect: (i) async {
                            final values = {0: 'az', 1: 'ru'};
                            if (state.langCode == values[i]) return;

                            await langCubit.changeLang(values[i]);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
