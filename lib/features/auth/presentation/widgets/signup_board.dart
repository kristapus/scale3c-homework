import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/signup_form.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/social_auth_options_row.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class SignupBoard extends StatelessWidget {
  const SignupBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignupForm(),
        const SizedBox(height: 16),
        Text('or', style: Theme.of(context).textTheme.mBold.copyWith(color: context.colors.secondaryDark)),
        const SizedBox(height: 16),
        const SocialAuthOptionsRow(),
        const SizedBox(height: 50),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: Theme.of(context).textTheme.mMedium.copyWith(color: context.colors.secondaryDark),
              ),
              TextSpan(
                text: 'Sign In',
                style: Theme.of(context).textTheme.mXBoldClick.copyWith(color: context.colors.secondaryAccent),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.go('/login');
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
