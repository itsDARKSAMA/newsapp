abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomState extends AppStates {}

class AppChangeScreenState extends AppStates {}

class AppGetAnimeLoadingState extends AppStates {}

class AppGetAnimeNewsSuccessState extends AppStates {}

class AppGetAnimeNewsErrorState extends AppStates {
  final String error;

  AppGetAnimeNewsErrorState(this.error);
}

class AppGetGamesLoadingState extends AppStates {}

class AppGetGamesNewsSuccessState extends AppStates {}

class AppGetGamesNewsErrorState extends AppStates {
  final String error;

  AppGetGamesNewsErrorState(this.error);
}

class AppGetSportsLoadingState extends AppStates {}

class AppGetSportsNewsSuccessState extends AppStates {}

class AppGetSportsNewsErrorState extends AppStates {
  final String error;
  AppGetSportsNewsErrorState(this.error);
}

class AppSwitchThemeMode extends AppStates {}
