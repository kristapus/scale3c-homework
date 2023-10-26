import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/resources/text_styles.dart';

class ProfileMainInformationSection extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final String address;
  final String id;

  const ProfileMainInformationSection({
    this.imageUrl,
    required this.username,
    required this.address,
    required this.id,
    super.key,
  });

  final double avatarSize = 114;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: SizedBox(
            width: avatarSize,
            height: avatarSize,
            child: imageUrl != null ? Image.network(imageUrl!) : AppImages.userImage.image(fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          username,
          style: Theme.of(context).textTheme.xlMedium.copyWith(color: context.colors.secondaryHeavy),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // To keep '•' centered
            Expanded(
              child: Text(
                address,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.mMedium.copyWith(color: context.colors.secondaryDark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '•',
                style: Theme.of(context).textTheme.mMedium.copyWith(color: context.colors.secondaryMedium),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                'ID: $id',
                style: Theme.of(context).textTheme.mMedium.copyWith(color: context.colors.secondaryDark),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      ],
    );
  }
}
