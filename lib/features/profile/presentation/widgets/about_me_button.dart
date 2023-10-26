import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/widgets/buttons/text_button.dart';

class AboutMeButton extends StatelessWidget {
  const AboutMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {},
      backgroundColor: Colors.transparent,
      textStyle: Theme.of(context).textTheme.mBold.copyWith(color: context.colors.secondaryDark),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: context.colors.secondaryThin,
        ),
      ),
      text: 'About Me',
    );
  }
}
