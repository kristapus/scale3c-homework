import 'package:equatable/equatable.dart';
import 'package:scale3c_homework/features/auth/data/models/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends AuthState {}

class Loading extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;

  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String? message;

  AuthFailed(this.message) : super();
}
