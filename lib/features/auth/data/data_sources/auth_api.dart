import 'package:scale3c_homework/core/networking/api.dart';
import 'package:scale3c_homework/core/networking/api_response.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';

abstract class AuthAPI extends API {
  AuthAPI({required super.headers, required super.baseUrl});

  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> register({
    required String email,
    required String password,
  });
}

class AuthAPIImpl extends API implements AuthAPI {
  AuthAPIImpl({required super.headers, required super.baseUrl});

  @override
  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final resp = await post('/api/auth/login', body: {
      'email': email,
      'password': password,
    });

    if (resp.status != Status.success) throw Exception();

    return UserModel.fromJson(resp.data);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
  }) async {
    final resp = await post('/user/register', body: {
      'email': email,
      'password': password,
    });

    if (resp.data == null) return throw Exception();

    return UserModel.fromJson(resp.data);
  }
}
