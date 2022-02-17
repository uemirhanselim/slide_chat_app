import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:slide_chat_app/helpers/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slide_chat_app/helpers/routes.dart';
import 'package:slide_chat_app/view/welcome_page.dart';
import 'package:slide_chat_app/view_model/welcome_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: ChangeNotifierProvider(
            create: (context) => WelcomeViewModel(),
            child: WelcomePage(),
          ),
          routes: Routes.getRoutes(),
        );
      },
    );
  }
}
