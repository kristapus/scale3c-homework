import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/profile/presentation/widgets/details_tile.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/images.dart';

class ProfileAdditionInformationSection extends StatelessWidget {
  final String phone;
  final String email;
  final int completedProject;

  const ProfileAdditionInformationSection({
    required this.phone,
    required this.email,
    required this.completedProject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsTile(
          icon: AppImages.phoneIcon.image(color: context.colors.secondaryAccent), // TODO: there is room for imprevement, as icons aspect ratio are not the same, therefore size as well...
          title: 'Phone',
          subtitle: phone,
        ),
        const SizedBox(height: 16),
        DetailsTile(
          icon: AppImages.emailIcon.image(color: context.colors.secondaryAccent),
          title: 'Email',
          subtitle: email,
        ),
        const SizedBox(height: 16),
        DetailsTile(
          icon: AppImages.completedIcon.image(color: context.colors.secondaryAccent),
          title: 'Completed project',
          subtitle: completedProject.toString(),
        ),
      ],
    );
  }
}
