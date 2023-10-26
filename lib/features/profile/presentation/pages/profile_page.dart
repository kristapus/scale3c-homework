import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';
import 'package:scale3c_homework/features/profile/presentation/widgets/profile_additional_information_section.dart';
import 'package:scale3c_homework/features/profile/presentation/widgets/profile_main_information_section.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/images.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/providers/auth_providers.dart';
import 'package:scale3c_homework/shared/widgets/base_page.dart';
import 'package:scale3c_homework/shared/widgets/buttons/button.dart';
import 'package:scale3c_homework/shared/widgets/buttons/text_button.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late final Function _authStateListener;

  // TODO: This properety is used to store user details after state is no longer
  // Authenticated, for UI/UX purposes, so the screen remain the same.
  late UserModel _user;

  static const double _horizontalPadding = 30.0;

  @override
  void initState() {
    super.initState();

    final authState = ref.read(authProvider);
    if (authState is! Authenticated) {
      throw Exception('During initialization, user must me Authenticated');
    } else {
      _user = authState.user;
    }

    _authStateListener = ref.read(authProvider.notifier).addListener(_authStateHandler);
  }

  @override
  void dispose() {
    _authStateListener();
    super.dispose();
  }

  void _authStateHandler(AuthState state) {
    if (state is! Authenticated) {
      context.go('/login');
    } else {
      setState(() => _user = state.user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: const SizedBox(),
      trailing: Button(
        minWidth: 0,
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        onPressed: () {},
        shape: const RoundedRectangleBorder(),
        child: AppImages.menuIcon.image(),
      ),
      appBarColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: _horizontalPadding,
                right: _horizontalPadding,
                top: 40,
              ),
              child: ProfileMainInformationSection(
                username: '${_user.firstName} ${_user.lastName}',
                address: 'Address',
                id: _user.id,
              ),
            ),
            const SizedBox(height: 17),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Edit',
                    style: Theme.of(context).textTheme.mXBoldClick.copyWith(color: context.colors.secondaryAccent),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(
                left: _horizontalPadding,
                right: _horizontalPadding,
                bottom: 40,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextButton(
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
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AppTextButton(
                      onPressed: () => ref.read(authProvider.notifier).logout(),
                      text: 'Log out',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              color: context.colors.secondaryHeavy,
              child: ProfileAdditionInformationSection(
                phone: _user.phone ?? '-',
                email: _user.email,
                completedProject: _user.completedProjects ?? 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
