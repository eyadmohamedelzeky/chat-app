part of 'register_cubit.dart';

abstract class RegisterState{
  const RegisterState();
}

class RegisterScreenInitial extends RegisterState {}

class RegisterScreenLoading extends RegisterState {}

class RegisterScreenSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String messageError;
  const RegisterFailure({required this.messageError});
}