import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search_screen.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/mode_cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        ModeCubit switchMode = ModeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                },
                icon: const Icon(Icons.search),
              ),
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
          bottomNavigationBar: FluidNavBar(
            defaultIndex: cubit.currntIndex,
            onChange: (selectedIndex) {
              cubit.changeBottomNav(selectedIndex);
            },
            style: FluidNavBarStyle(
              iconUnselectedForegroundColor: Colors.white,
              iconSelectedForegroundColor: Colors.white,
              barBackgroundColor: Theme.of(context).primaryColor,
            ),
            icons: [
              FluidNavBarIcon(icon: Icons.star, extras: {"label": "Anime"}),
              FluidNavBarIcon(icon: Icons.gamepad, extras: {"label": "Games"}),
              FluidNavBarIcon(
                  icon: Icons.sports_soccer, extras: {"label": "Sports"}),
            ],
          ),
          body: cubit.screens[cubit.currntIndex],
        );
      },
    );
  }
}
