import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scale3c_homework/core/extensions/build_context_extension.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';
import 'package:scale3c_homework/resources/colors.dart';
import 'package:scale3c_homework/resources/text_styles.dart';
import 'package:scale3c_homework/shared/providers/auth_providers.dart';
import 'package:scale3c_homework/shared/widgets/buttons/text_button.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/password_text_field.dart';
import 'package:scale3c_homework/shared/widgets/text_fields/username_text_field.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController passwordController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController confirmPasswordController = TextEditingController.fromValue(TextEditingValue.empty);

  late final Function _authStateListener;

  bool _isValid = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _authStateListener = ref.read(authProvider.notifier).addListener((state) {
      print('state changed');
      if (state is Authenticated) context.go('/profile');
    });

    emailController.addListener(_validateFormWithoutRebuilding);
    passwordController.addListener(_validateFormWithoutRebuilding);
    confirmPasswordController.addListener(_validateFormWithoutRebuilding);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _authStateListener();
    super.dispose();
  }

  // Validates form without showing error to user, because of UX
  void _validateFormWithoutRebuilding() {
    bool isEmailValid = EmailTextField.validator(emailController.text) == null;
    bool isPasswordValid = PasswordTextField.emptyValidator(passwordController.text) == null;
    bool isConfirmPasswordValid = confirmPasswordValidator(confirmPasswordController.text) == null;
    bool isValid = isEmailValid && isPasswordValid && isConfirmPasswordValid;

    if (_isValid != isValid) {
      setState(() => _isValid = isValid);
    }
  }

  String? confirmPasswordValidator(String? text) {
    if (text != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

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

  void _register() async {
    _showErrors(); // Dissmisses any shown errors while loading

    final state = await ref.read(authProvider.notifier).register(
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
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          EmailTextField(
            controller: emailController,
            hint: 'Enter email',
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            controller: passwordController,
            hint: 'Enter password',
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            controller: confirmPasswordController,
            hint: 'Confirm password',
            validator: confirmPasswordValidator,
          ),
          const SizedBox(height: 16),
          if (_errorMessage != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                _errorMessage!,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.mBold.copyWith(color: Colors.red),
              ),
            ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, watch, child) {
              final authState = ref.watch(authProvider);

              if (authState is Loading || authState is Authenticated) {
                return AppTextButton(
                  onPressed: () {},
                  backgroundColor: context.colors.secondaryThin,
                  text: 'Loading...',
                );
              }

              return AppTextButton(
                onPressed: _isValid ? _register : _showErrors,
                backgroundColor: _isValid ? context.colors.primaryColor : context.colors.secondaryThin,
                text: 'Sign Up',
              );
            },
          ),
        ],
      ),
    );
  }
}
