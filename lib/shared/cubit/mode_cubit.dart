import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/shared/cubit/states.dart';

class ModeCubit extends Cubit<AppStates> {
  ModeCubit() : super(AppInitialState());

  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void switchThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppSwitchThemeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppSwitchThemeMode());
      });
    }
  }
}
