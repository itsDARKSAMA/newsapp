import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layouts/home_layout.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/bloc_observer.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/mode_cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp(
    isDark: CacheHelper.getBoolean(key: 'isdark'),
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getGamesNews()
            ..getAnimeNews()
            ..getSportsNews(),
        ),
        BlocProvider(
          create: (context) => ModeCubit()..switchThemeMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<ModeCubit, AppStates>(
        listener: (context, state) {
          if (state is AppSwitchThemeMode) {
            log('swticehr lool');
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
              primaryColor: HexColor('#B643CD'),
              appBarTheme: const AppBarTheme(
                // color: Colors.red,
                actionsIconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  // systemNavigationBarColor: Colors.red,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // fontFamily: ''
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 20,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                headline1: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle2: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: HexColor('#B643CD'),
              // primarySwatch: ,
              appBarTheme: AppBarTheme(
                // color: Colors.red,
                actionsIconTheme: const IconThemeData(color: Colors.white),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                  // systemNavigationBarColor: Colors.red,
                ),
                backgroundColor: HexColor('#202124'),
                elevation: 0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // fontFamily: ''
                ),
              ),
              scaffoldBackgroundColor: HexColor('#202124'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#202124'),
                unselectedItemColor: Colors.grey,
                elevation: 20,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                headline1: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle2: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            // ThemeMode.dark,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
