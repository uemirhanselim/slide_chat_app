import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_chat_app/helpers/routes.dart';

class SharedPreferencesServices {
  SharedPreferences? prefs;

  SharedPreferencesServices() {
    instance();
  }

  instance() async {
    prefs = await SharedPreferences.getInstance();
  }

  setToShared(key, value) async {
    if (prefs != null) await prefs!.setString(key, value);
  }

  clearShared() {
    if (prefs != null) prefs!.clear();
  }

  getDataFromShared(key) {
    return prefs != null ? prefs!.getString(key) : null;
  }

  logOut() {
    Routes.openLoginPage(true);
  }
}
