import 'package:scale3c_homework/core/errors/exceptions.dart';
import 'package:scale3c_homework/core/errors/failures.dart';
import 'package:scale3c_homework/features/auth/data/data_sources/auth_api.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';
import 'package:scale3c_homework/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepository implements IAuthRepository {
  final AuthAPI authAPI;

  const AuthRepository({required this.authAPI});

  @override
  Future<Either<Failure, UserModel>> loginWithEmail({required String email, required String password}) async {
    try {
      final user = await authAPI.loginWithEmail(email: email, password: password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({required String email, required String password}) async {
    try {
      final user = await authAPI.register(email: email, password: password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      print(e.toString());
      return const Left(ServerFailure(''));
    }
  }
}
