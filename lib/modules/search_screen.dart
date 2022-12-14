import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/mode_cubit.dart';

import '../shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).searchList;
          ModeCubit switchMode = ModeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    // cubit.switchThemeMode();
                    switchMode.switchThemeMode();
                  },
                  icon: Icon(
                    switchMode.isDark ? Icons.light_mode : Icons.dark_mode,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DefaultFormField(
                    fieldContorller: searchController,
                    textLabel: "Search",
                    // fieldContorller: ,
                    prefixIcon: Icons.search,
                    keyboardType: TextInputType.text,
                    onChange: (value) => AppCubit.get(context).getSearch(value),
                  ),
                ),
                Expanded(
                  // flex: 5,
                  // fit: FlexFit.loose,
                  child: articleBuilder(list, isSearch: true),
                ),
              ],
            ),
          );
        });
  }
}
