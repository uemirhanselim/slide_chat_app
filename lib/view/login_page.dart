import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:slide_chat_app/extension/context_extension.dart';
import 'package:slide_chat_app/helpers/color_helper.dart';
import 'package:slide_chat_app/view/common/auth_button_style.dart';
import 'package:slide_chat_app/view/common/auth_text_field.dart';
import 'package:slide_chat_app/view/common/constants.dart';
import 'package:slide_chat_app/view_model/login_view_model.dart';
import 'package:slide_chat_app/widgets/space_holder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getDynamicWidth(0.06)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(child: Image.asset('images/slide_login.png')),
            emptySpaceHeight(context, 0.16),
            Flexible(
              child: AuthTextField(
                  emailController,
                  TextInputAction.next,
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                  TextInputType.emailAddress,
                  false),
            ),
            emptySpaceHeight(context, 0.02),
            Flexible(
              child: AuthTextField(
                  passwordController,
                  TextInputAction.done,
                  kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                  TextInputType.name,
                  true),
            ),
            emptySpaceHeight(context, 0.02),
            Flexible(
              child: Container(
                height: context.getDynamicHeight(0.07),
                child: Consumer<LoginViewModel>(
                  builder: (_, viewModel, child) => ElevatedButton(
                    child: const Text('Log in'),
                    style: AuthButtonStyle,
                    onPressed: () {
                      viewModel.login(
                        context,
                        emailController.text.toString(),
                        passwordController.text.toString(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*      --- Checkbox ---
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Theme(data: ThemeData(unselectedWidgetColor: Color(0xff00c8e8)),
                    child: Checkbox(value: _isChecked, onChanged: onChanged)),
                ),
              ],
            ),
*/
