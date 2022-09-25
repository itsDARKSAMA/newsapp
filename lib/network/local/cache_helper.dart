import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    // create instance
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //set data
  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  // get data
  static bool? getBoolean({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }
}
