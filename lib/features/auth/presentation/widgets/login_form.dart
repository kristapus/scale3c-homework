import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';
import 'package:scale3c_homework/features/auth/presentation/widgets/form_error_message.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/providers/auth_providers.dart';
import 'package:scale3c_homework/shared/widgets/buttons/text_button.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/password_text_field.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/username_text_field.dart';

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
  String? _errorMessage;

  late final Function _authStateListener;

  @override
  void initState() {
    super.initState();

    _authStateListener = ref.read(authProvider.notifier).addListener((state) {
      if (state is Authenticated) context.go('/profile');
    });

    emailController.addListener(_validateFormWithoutRebuilding);
    passwordController.addListener(_validateFormWithoutRebuilding);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _authStateListener();
    super.dispose();
  }

  // Validates Form without showing errors to user, because of UX.
  // Comment bellow has a solution.
  void _validateFormWithoutRebuilding() {
    bool isEmailValid = EmailTextField.validator(emailController.text) == null;
    bool isPasswordValid = PasswordTextField.emptyValidator(passwordController.text) == null;
    bool isValid = isEmailValid && isPasswordValid;

    if (_isValid != isValid) {
      setState(() => _isValid = isValid);
    }
  }

  // TODO: this part looks messy. It would better to create FromField wrapper and have more
  // control over errorMessages;
  void _showErrors() {
    if (_formKey.currentState == null) {
      throw Exception('key does not have state');
    } else {
      _formKey.currentState?.validate();
      _setErrorMessage(null);
    }
  }

  void _setErrorMessage(String? message) {
    setState(() => _errorMessage = message);
  }

  void login() async {
    _showErrors(); // Dissmisses any shown errors while loading

    final state = await ref.read(authProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
        );

    // TODO: this is a temporary way to display error's from the server
    if (state is AuthFailed) {
      _setErrorMessage(state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          EmailTextField(controller: emailController),
          const SizedBox(height: 16),
          PasswordTextField(controller: passwordController),
          if (_errorMessage != null) FormErrorMessage(message: _errorMessage!),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot your password?',
              style: Theme.of(context).textTheme.mBold.copyWith(color: context.colors.secondaryDark),
            ),
          ),
          const SizedBox(height: 50),
          (authState is Loading || authState is Authenticated)
              ? AppTextButton(
                  onPressed: () {},
                  backgroundColor: context.colors.secondaryThin,
                  text: 'Loading...',
                )
              : AppTextButton(
                  onPressed: _isValid ? login : _showErrors,
                  backgroundColor: _isValid ? context.colors.primaryColor : context.colors.secondaryThin,
                  text: 'Login',
                )
        ],
      ),
    );
  }
}
