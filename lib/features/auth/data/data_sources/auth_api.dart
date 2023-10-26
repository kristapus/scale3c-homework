import 'package:scale3c_homework/core/errors/exceptions.dart';
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

    if (resp.status != Status.success) throw ServerException(resp.data['message']);

    return UserModel.fromJson(resp.data);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
  }) async {
    // TODO: this part is hardcoded purely because of testing purposes
    final resp = await post('/api/auth/register', body: {
      'email': email,
      'password': password,
      'phone': '+37088888888',
      'first_name': 'Kristupas',
      'last_name': 'Kuras',
      'date_of_birth': '2000-01-01T00:00:00.000Z',
      'role_id': 3,
    });

    print(resp.data);

    if (resp.status != Status.success) throw ServerException(resp.data['message']);

    return UserModel.fromJson(resp.data);
  }
}
