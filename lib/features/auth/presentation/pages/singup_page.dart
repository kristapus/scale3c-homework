import 'package:flutter/material.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/signup_board.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/presentation/widgets/base_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: Text('Sign Up', style: Theme.of(context).textTheme.lBold),
      appBarColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(height: 60),
              AppImages.signupImage.image(),
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const SignupBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
