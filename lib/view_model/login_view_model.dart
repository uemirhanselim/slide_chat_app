import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_chat_app/helpers/locator.dart';
import 'package:slide_chat_app/helpers/routes.dart';
import 'package:slide_chat_app/repository/auth_repository.dart';
import 'package:slide_chat_app/service/shared_preferences_services.dart';
import 'package:slide_chat_app/widgets/loading_dialog.dart';

class LoginViewModel with ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();
  SharedPreferencesServices pref = locator<SharedPreferencesServices>();
  final _auth = FirebaseAuth.instance;

  LoginViewModel();

  login(context, email, password) async {
    try {
      LoadingDialog dialog = LoadingDialog(
        loadingText: 'Loading...',
      );
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return dialog;
          });

      final user =
          _auth.signInWithEmailAndPassword(email: email, password: password);
      pref.setToShared('userEmail', email);
      pref.setToShared('userPassword', password);

      if (user != null) {
        dialog.cancel(context);
        Routes.openTabBarPage();
      }
    } catch (e) {
      print('LoginViewModel / login $e');
    }
  }
}
