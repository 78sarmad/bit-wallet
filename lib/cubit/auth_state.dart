part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateLoggedIn extends AuthState {}

class AuthStateRegister extends AuthState {}


