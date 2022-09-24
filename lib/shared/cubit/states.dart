abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeBottomState extends AppState {}

class AppChangeScreenState extends AppState {}

class AppGetAnimeLoadingState extends AppState {}

class AppGetAnimeNewsSuccessState extends AppState {}

class AppGetAnimeNewsErrorState extends AppState {
  final String error;

  AppGetAnimeNewsErrorState(this.error);
}

class AppGetGamesLoadingState extends AppState {}

class AppGetGamesNewsSuccessState extends AppState {}

class AppGetGamesNewsErrorState extends AppState {
  final String error;

  AppGetGamesNewsErrorState(this.error);
}

class AppGetSportsLoadingState extends AppState {}

class AppGetSportsNewsSuccessState extends AppState {}

class AppGetSportsNewsErrorState extends AppState {
  final String error;
  AppGetSportsNewsErrorState(this.error);
}

class AppSwitchThemeMode extends AppState {}
