import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..getAnimeNews(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.switchThemeMode();
                    },
                    icon: Icon(
                      cubit.isDark ? Icons.light_mode : Icons.dark_mode,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currntIndex,
                onTap: (index) => cubit.changeBottomNav(index),
                items: cubit.bottomNavItems,
              ),
              body: cubit.screens[cubit.currntIndex],
            );
          },
        ));
  }
}
