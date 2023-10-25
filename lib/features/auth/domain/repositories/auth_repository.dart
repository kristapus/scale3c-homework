import 'package:scale3c_homework/features/auth/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?> loginWithEmail({required String email, required String password});

  Future<UserModel?> register({required String email, required String password});
}
