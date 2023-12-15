part of 'login_cubit.dart';
abstract class LoginScreenState {
  const LoginScreenState();
}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenLoading extends LoginScreenState {}

class LoginScreenSuccess extends LoginScreenState {}

class LoginScreenError extends LoginScreenState {
  final String message;

  LoginScreenError({required this.message});
}