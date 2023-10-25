import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/presentation/providers/auth_providers.dart';
import 'package:scale3c_homework/shared/presentation/widgets/buttons/text_button.dart';
import 'package:scale3c_homework/shared/presentation/widgets/text_fields/password_text_field.dart';
import 'package:scale3c_homework/shared/presentation/widgets/text_fields/username_text_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController passwordController = TextEditingController.fromValue(TextEditingValue.empty);

  bool _isValid = false;

  late final Function authStateListener;

  @override
  void initState() {
    super.initState();

    authStateListener = ref.read(authProvider.notifier).addListener((state) {
      if (state is Authenticated) context.go('/profile');
    });

    emailController.addListener(_validateFormWithoutRebuilding);
    passwordController.addListener(_validateFormWithoutRebuilding);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    authStateListener();
    super.dispose();
  }

  // Validates form without showing error to user, because of UX
  void _validateFormWithoutRebuilding() {
    bool isEmailValid = EmailTextField.validator(emailController.text) == null;
    bool isPasswordValid = PasswordTextField.emptyValidator(passwordController.text) == null;
    bool isValid = isEmailValid && isPasswordValid;

    if (_isValid != isValid) {
      setState(() => _isValid = isValid);
    }
  }

  void _showErrors() {
    if (_formKey.currentState == null) {
      throw Exception('key does not have state');
    } else {
      _formKey.currentState?.validate();
    }
  }

  void login() {
    _showErrors(); // Dissmisses any shown errors while loading

    ref.read(authProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          EmailTextField(controller: emailController),
          const SizedBox(height: 16),
          PasswordTextField(controller: passwordController),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot your password?',
              style: Theme.of(context).textTheme.mBold.copyWith(color: AppColors.darkGrey),
            ),
          ),
          const SizedBox(height: 50),
          Consumer(
            builder: (context, watch, child) {
              final authState = ref.watch(authProvider);

              if (authState is Loading || authState is Authenticated) {
                return AppTextButton(
                  onPressed: () {},
                  backgroundColor: AppColors.thinGrey,
                  text: 'Loading...',
                );
              }

              return AppTextButton(
                onPressed: _isValid ? login : _showErrors,
                backgroundColor: _isValid ? AppColors.green : AppColors.thinGrey,
                text: 'Login',
              );
            },
          ),
        ],
      ),
    );
  }
}
