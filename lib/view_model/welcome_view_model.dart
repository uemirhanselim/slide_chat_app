import 'package:flutter/cupertino.dart';
import 'package:slide_chat_app/helpers/locator.dart';
import 'package:slide_chat_app/helpers/routes.dart';
import 'package:slide_chat_app/service/shared_preferences_services.dart';

class WelcomeViewModel with ChangeNotifier {
  var pref = locator.get<SharedPreferencesServices>();

  navigate(BuildContext context) {
    _checkIsFirstTime(context);
    notifyListeners();
  }

  _checkIsFirstTime(context) async {
    var isFirstTime = pref.getDataFromShared('isFirstTime');
    if (isFirstTime == null || isFirstTime == '') {
      print("null veya '' şekilde döndü" + isFirstTime.toString());
      pref.setToShared('isFirstTime', 'false');
    } else {
      print("Başka bir değeri var" + isFirstTime.toString());
      _checkIsSignIn(context);
    }
  }

  _checkIsSignIn(context) {
    var userEmail = pref.getDataFromShared('userEmail');

    print('User Email => $userEmail');

    if (userEmail != null) _openDiscoverPage(context);
  }

  _openDiscoverPage(BuildContext context) {}
}
