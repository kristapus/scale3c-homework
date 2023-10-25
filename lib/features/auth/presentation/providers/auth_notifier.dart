import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scale3c_homework/features/auth/data/models/user_model.dart';
import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';

//searching
//lokacija

class AuthNotifier extends StateNotifier<AuthState> {
  final StateNotifierProviderRef<AuthNotifier, AuthState> ref;
  final IAuthRepository authRepository;

  AuthNotifier({required this.ref, required this.authRepository}) : super(Initial());

  // UserModel get user => (state as SuccessUserState).user;

  Future<void> login(UserModel user) async {
    final authUser = await authRepository.loginWithEmail(email: user.email, password: user.password);

    if (authUser == null) {
      state = AuthFailed();
    } else {
      state = Authenticated(user: authUser);
    }
  }
}
