import 'package:flutter/material.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/widgets/buttons/button.dart';

class DetailsTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const DetailsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Button(
        onPressed: () {},
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: context.colors.secondaryThin.withOpacity(0.3),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 72,
                child: icon,
              ),
              VerticalDivider(
                thickness: 1.0,
                width: 1.0,
                color: context.colors.secondaryThin.withOpacity(0.3),
              ),
              const SizedBox(width: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.sMedium.copyWith(
                          color: context.colors.primaryAccent.withOpacity(0.38),
                          fontSize: 14,
                          height: 22 / 14, // TODO: by default, there is inconsistenty comprared to figma design, need to ask designer how are they dealing with heiht lines.
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.mMedium.copyWith(
                          color: context.colors.primaryAccent,
                          fontSize: 16,
                          height: 22 / 16,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
