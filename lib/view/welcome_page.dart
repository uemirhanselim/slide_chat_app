import 'package:flutter/material.dart';
import 'package:slide_chat_app/helpers/color_helper.dart';
import 'package:slide_chat_app/extension/context_extension.dart';
import 'package:slide_chat_app/helpers/routes.dart';
import 'package:slide_chat_app/view/common/auth_button_style.dart';
import 'package:slide_chat_app/view_model/welcome_view_model.dart';
import 'package:slide_chat_app/widgets/space_holder.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _navigate(context);
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getDynamicWidth(0.06)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/slide.png'),
            const Center(
              child: Text(
                'Welcome to SLIDE',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Unlimited messaging, free stickers, and more!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontSize: 17.0,
                ),
              ),
            ),
            emptySpaceHeight(context, 0.2),
            Container(
              height: context.getDynamicHeight(0.07),
              child: ElevatedButton(
                style: AuthButtonStyle,
                onPressed: () {
                  Routes.openLoginPage(false);
                },
                child: const Text('Log in'),
              ),
            ),
            Container(
              height: context.getDynamicHeight(0.07),
              child: TextButton(
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: ColorHelper.whiteColor),
                ),
                onPressed: () {
                  Routes.openRegisterPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _navigate(BuildContext context) {
  //   WidgetsBinding.instance?.addPostFrameCallback((_) async {
  //     WelcomeViewModel viewModel = Provider.of<WelcomeViewModel>(
  //       context,
  //       listen: false,
  //     );
  //     viewModel.navigate(context);
  //   });
  // }
}
