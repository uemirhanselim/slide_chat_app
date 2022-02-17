import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_chat_app/extension/context_extension.dart';
import 'package:slide_chat_app/helpers/color_helper.dart';
import 'package:slide_chat_app/view/common/auth_button_style.dart';
import 'package:slide_chat_app/view/common/auth_text_field.dart';
import 'package:slide_chat_app/view/common/constants.dart';
import 'package:slide_chat_app/view_model/register_view_model.dart';
import 'package:slide_chat_app/widgets/error_dialog.dart';
import 'package:slide_chat_app/widgets/space_holder.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  late String coverImage =
      'https://cutewallpaper.org/21/background-cover-image/Simple-Background-That-Can-be-Texted-Facebook-Cover.jpg';
  late String profileImage =
      'https://i.pinimg.com/474x/76/94/84/769484dafbe89bf2b8a22379658956c4.jpg ';
  late String tag = 'New User';
  late String aboutMe = '';

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
            emptySpaceHeight(context, 0.10),
            AuthTextField(
              emailController,
              TextInputAction.next,
              kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              TextInputType.emailAddress,
              false,
            ),
            emptySpaceHeight(context, 0.02),
            AuthTextField(
              passwordController,
              TextInputAction.next,
              kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              TextInputType.name,
              true,
            ),
            emptySpaceHeight(context, 0.02),
            AuthTextField(
              userNameController,
              TextInputAction.done,
              kTextFieldDecoration.copyWith(hintText: 'Enter your username'),
              TextInputType.name,
              false,
            ),
            emptySpaceHeight(context, 0.02),
            Flexible(
              child: Container(
                height: context.getDynamicHeight(0.07),
                child: Consumer<RegisterViewModel>(
                  builder: (_, viewModel, child) => ElevatedButton(
                    child: const Text('Sign in'),
                    style: AuthButtonStyle,
                    onPressed: () {
                      if(userNameController.text == "" || emailController.text == "" || passwordController.text == ""){
                        ErrorDialog errorDialog = const ErrorDialog();
                        showDialog(context: context, builder: (_) => errorDialog);
                      }else{
                        viewModel.register(
                          context,
                          userNameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          coverImage,
                          profileImage,
                          aboutMe,
                          tag); 
                      userNameController.clear();
                      }
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
