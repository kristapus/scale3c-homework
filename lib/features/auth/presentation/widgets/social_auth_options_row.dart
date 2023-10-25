import 'package:flutter/material.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:scale3c_homework/resources/images.dart';

class SocialAuthOptionsRow extends StatelessWidget {
  const SocialAuthOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SocialAuthButton(
            onPressed: () {},
            icon: AppImages.facebookIcon.image(),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SocialAuthButton(
            onPressed: () {},
            icon: AppImages.twitterIcon.image(),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SocialAuthButton(
            onPressed: () {},
            icon: AppImages.linkedinIcon.image(),
          ),
        ),
      ],
    );
  }
}
