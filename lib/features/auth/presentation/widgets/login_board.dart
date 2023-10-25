import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/password_text_field.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/social_button.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/username_text_field.dart';
import 'package:scale3c_homework/shared/presentation/widgets/text_button.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class LoginBoard extends StatelessWidget {
  final void Function() onSignUpTap;

  const LoginBoard({
    required this.onSignUpTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UsernameTextField(),
        const SizedBox(height: 16),
        const PasswordTextField(),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot your password?',
            style: Theme.of(context).textTheme.mBold.copyWith(color: AppColors.darkGrey),
          ),
        ),
        const SizedBox(height: 50),
        AppTextButton(
          onPressed: () {},
          text: 'Login',
        ),
        const SizedBox(height: 16),
        Text(
          'or',
          style: Theme.of(context).textTheme.mBold.copyWith(color: AppColors.darkGrey),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                onPressed: () {},
                icon: AppImages.facebookIcon.image(),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SocialButton(
                onPressed: () {},
                icon: AppImages.twitterIcon.image(),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SocialButton(
                onPressed: () {},
                icon: AppImages.linkedinIcon.image(),
              ),
            ),
          ],
        ),
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
                recognizer: TapGestureRecognizer()..onTap = onSignUpTap,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
