import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_chat_app/view/login_page.dart';
import 'package:slide_chat_app/view/register_page.dart';
import 'package:slide_chat_app/view/tab_bar_page.dart';
import 'package:slide_chat_app/view/welcome_page.dart';
import 'package:slide_chat_app/view_model/login_view_model.dart';
import 'package:slide_chat_app/view_model/register_view_model.dart';
import 'package:slide_chat_app/view_model/welcome_view_model.dart';

class Routes {
  static const String WELCOME_PAGE = '/welcome_page';
  static const String LOGIN_PAGE = '/login_page';
  static const String REGISTER_PAGE = '/register_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      WELCOME_PAGE: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => WelcomeViewModel(),
            child: const WelcomePage(),
          ),
    };
  }

  static openLoginPage(isOff) {
    isOff
        ? Get.offAll(
            () => ChangeNotifierProvider(
              create: (context) => LoginViewModel(),
              child: LoginPage(),
            ),
          )
        : Get.to(
            () => ChangeNotifierProvider(
              create: (context) => LoginViewModel(),
              child: LoginPage(),
            ),
          );
  }

  static openRegisterPage() {
    Get.to(() => ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
          child: RegisterPage(),
        ));
  }

  static openTabBarPage() {
    Get.to(const TabBarPage());
  }
}
