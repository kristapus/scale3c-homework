import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scale3c_homework/features/auth/data/data_sources/auth_api.dart';
import 'package:scale3c_homework/features/auth/data/repositories/auth_repository.dart';
import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_notifier.dart';
import 'package:scale3c_homework/features/auth/presentation/providers/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref: ref, authRepository: ref.read(authRepositoryProvider));
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(authAPI: AuthAPIImpl(baseUrl: 'corsavelo-server.azurewebsites.net', headers: {'Content-Type': 'application/json'}));
});
