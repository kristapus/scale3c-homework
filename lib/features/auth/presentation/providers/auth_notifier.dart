import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';

//searching
//lokacija

class AuthNotifier extends StateNotifier<AuthState> {
  final StateNotifierProviderRef<AuthNotifier, AuthState> ref;
  final IAuthRepository authRepository;

  AuthNotifier({required this.ref, required this.authRepository}) : super(Initial());

  Future<AuthState> login({required String email, required String password}) async {
    state = Loading();

    final result = await authRepository.loginWithEmail(email: email, password: password);

    state = result.match(
      (failure) => AuthFailed(failure.message),
      (user) => Authenticated(user: user),
    );

    return state;
  }

  Future<AuthState> register({required String email, required String password}) async {
    state = Loading();

    final result = await authRepository.register(email: email, password: password);

    state = result.match(
      (failure) => AuthFailed(failure.message),
      (user) => Authenticated(user: user),
    );

    return state;
  }

  void logout() {
    state = Initial();
  }
}
