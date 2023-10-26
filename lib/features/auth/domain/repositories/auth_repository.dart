import 'package:scale3c_homework/core/errors/failures.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserModel>> loginWithEmail({required String email, required String password});

  Future<Either<Failure, UserModel>> register({required String email, required String password});
}
