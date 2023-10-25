import 'package:scale3c_homework/features/auth/data/data_sources/auth_api.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';
import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final AuthAPI authAPI;

  const AuthRepository({required this.authAPI});

  @override
  Future<UserModel?> loginWithEmail({required String email, required String password}) {
    try {
      return authAPI.loginWithEmail(email: email, password: password);
    } catch (e) {
      return Future.value(null); // TODO: should return different object. Ex Either
    }
  }

  @override
  Future<UserModel?> register({required String email, required String password}) {
    try {
      return authAPI.register(email: email, password: password);
    } catch (e) {
      return Future.value(null); // TODO: should return different object. Ex Either
    }
  }
}

class MockAuthRepository implements IAuthRepository {
  final AuthAPI authAPI;

  const MockAuthRepository({required this.authAPI});

  @override
  Future<UserModel?> loginWithEmail({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));

    return UserModel(email: email, password: password);
  }

  @override
  Future<UserModel?> register({required String email, required String password}) {
    try {
      return authAPI.register(email: email, password: password);
    } catch (e) {
      return Future.value(null); // TODO: should return different object. Ex Either
    }
  }
}
