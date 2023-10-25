import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/login_form.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/social_auth_options_row.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class LoginBoard extends StatelessWidget {
  const LoginBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginForm(),
        const SizedBox(height: 16),
        Text('or', style: Theme.of(context).textTheme.mBold.copyWith(color: AppColors.darkGrey)),
        const SizedBox(height: 16),
        const SocialAuthOptionsRow(),
        const SizedBox(height: 50),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account? ",
                style: Theme.of(context).textTheme.mMedium.copyWith(color: AppColors.darkGrey),
              ),
              TextSpan(
                text: 'Sign Up',
                style: Theme.of(context).textTheme.mXBoldClick.copyWith(color: AppColors.peach),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.go('/signup');
                  },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
