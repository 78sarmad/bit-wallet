part of 'auth_progress_cubit.dart';

@immutable
abstract class AuthProgressState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthProgressInitial extends AuthProgressState {}

class AuthProgressLoginError extends AuthProgressState {
  final dynamic error;

  AuthProgressLoginError({@required this.error});

  @override
  List<Object> get props => [error];
}

class AuthProgressRegisterError extends AuthProgressState {
  final dynamic error;

  AuthProgressRegisterError({@required this.error});

  @override
  List<Object> get props => [error];

}

class AuthProgressLogin extends AuthProgressState {}

class AuthProgressRegister extends AuthProgressState {}

class AuthProgressLoginSuccess extends AuthProgressState {}

class AuthProgressRegisterSuccess extends AuthProgressState {}