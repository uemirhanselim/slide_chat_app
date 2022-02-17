import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_chat_app/helpers/locator.dart';
import 'package:slide_chat_app/helpers/routes.dart';
import 'package:slide_chat_app/repository/auth_repository.dart';
import 'package:slide_chat_app/widgets/loading_dialog.dart';

class RegisterViewModel with ChangeNotifier {
  final AuthRepository _repository = locator<AuthRepository>();
  final _auth = FirebaseAuth.instance;

  void register(
      context,
      String? userName,
      String? email,
      String? password,
      String? coverImage,
      String? profileImage,
      String? aboutMe,
      String? tag) async {
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
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      if (newUser != null) {
        print("user null değil");
        _repository.register(
            userName, email, password, coverImage, profileImage, aboutMe, tag);
      } else {
        print('user not found!');
      }

      dialog.cancel(context);
      Routes.openLoginPage(true);
    } catch (e) {
      print('RegisterViewModel / register $e');
    }
  }
}
