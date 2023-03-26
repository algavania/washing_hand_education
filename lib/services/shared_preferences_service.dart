import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> get _instance async =>
      prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs ?? await SharedPreferences.getInstance();
  }

  static String? getHandwashId() {
    return prefs?.getString('handwashId');
  }

  static Future<void> setHandwashId(String handwashId) async {
    await prefs?.setString('handwashId', handwashId);
  }
}
