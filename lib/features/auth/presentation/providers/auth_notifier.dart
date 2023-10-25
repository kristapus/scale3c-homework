import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';

//searching
//lokacija

class AuthNotifier extends StateNotifier<AuthState> {
  final StateNotifierProviderRef<AuthNotifier, AuthState> ref;
  final IAuthRepository authRepository;

  AuthNotifier({required this.ref, required this.authRepository}) : super(Initial()) {
    addListener((state) {
      print('AuthNotifier state=$state');
    });
  }

  // UserModel get user => (state as SuccessUserState).user;

  Future<void> login({required String email, required String password}) async {
    state = Loading();

    final authUser = await authRepository.loginWithEmail(email: email, password: password);

    if (authUser == null) {
      state = AuthFailed();
    } else {
      state = Authenticated(user: authUser);
    }
  }
}
