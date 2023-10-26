import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/login_board.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/widgets/base_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: Text('Sign In', style: Theme.of(context).textTheme.lBold),
      appBarColor: context.colors.primaryAccent,
      body: Center(
        child: SingleChildScrollView(
          // TODO: LoginPage and Signup page can be refactored even more, but thats debatable if its worth it
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(height: 60),
              AppImages.loginImage.image(),
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const LoginBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
