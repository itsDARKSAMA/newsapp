import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/anime_screen.dart';
import 'package:newsapp/modules/games_screen.dart';
import 'package:newsapp/modules/sport_screen.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'dart:developer' as developer;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currntIndex = 1;
  List screens = const [
    AnimeScreen(),
    GamesScreen(),
    SportScreen(),
  ];
  var bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.animation_rounded),
      label: 'Anime',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.gamepad),
      label: 'Games',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
  ];
  void changeBottomNav(index) {
    currntIndex = index;
    // if (index == 0) getAnimeNews();
    // if (index == 2) getSportsNews();
    emit(AppChangeBottomState());
  }

  List<dynamic> animeList = [];

  void getAnimeNews() {
    emit(AppGetAnimeLoadingState());
    if (animeList.isEmpty) {
      Map<String, dynamic> query = {
        'q': 'anime',
        'apiKey': '8b64149574d04d98a2389dcbdd039813',
      };
      DioHelper.getData(
        url: 'v2/everything',
        query: query,
      ).then((value) {
        animeList = value.data['articles'];
        emit(AppGetAnimeNewsSuccessState());
      }).catchError((error) {
        developer.log('error is : ${error.data.toString()}');
        emit(AppGetAnimeNewsErrorState(error.toString()));
      });
    } else {
      emit(AppGetAnimeNewsSuccessState());
    }
  }

  List<dynamic> gamesList = [];

  void getGamesNews() {
    emit(AppGetGamesLoadingState());
    if (gamesList.isEmpty) {
      Map<String, dynamic> query = {
        'q': 'games',
        'apiKey': '8b64149574d04d98a2389dcbdd039813',
      };
      DioHelper.getData(
        url: 'v2/everything',
        query: query,
      ).then((value) {
        gamesList = value.data['articles'];
        emit(AppGetGamesNewsSuccessState());
      }).catchError((error) {
        developer.log('error is : ${error.data.toString()}');
        emit(AppGetGamesNewsErrorState(error.toString()));
      });
    } else {
      emit(AppGetGamesNewsSuccessState());
    }
  }

  List<dynamic> sportsList = [];

  void getSportsNews() {
    emit(AppGetSportsLoadingState());

    if (sportsList.isEmpty) {
      Map<String, dynamic> query = {
        'category': 'sports',
        'apiKey': '8b64149574d04d98a2389dcbdd039813',
      };
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: query,
      ).then((value) {
        sportsList = value.data['articles'];
        emit(AppGetSportsNewsSuccessState());
      }).catchError((error) {
        developer.log('error is : ${error.data.toString()}');
        emit(AppGetSportsNewsErrorState(error.toString()));
      });
    } else {
      emit(AppGetSportsNewsSuccessState());
    }
  }

  List<dynamic> searchList = [];

  void getSearch(value) {
    emit(AppGetSearchLoadingState());

    Map<String, dynamic> query = {
      'q': '$value',
      'apiKey': '8b64149574d04d98a2389dcbdd039813',
    };
    DioHelper.getData(
      url: 'v2/everything',
      query: query,
    ).then((value) {
      searchList = value.data['articles'];
      emit(AppGetSearchNewsSuccessState());
    }).catchError((error) {
      developer.log('error is : ${error.data.toString()}');
      emit(AppGetSearchNewsErrorState(error.toString()));
    });

    // searchList = [];
  }
}
