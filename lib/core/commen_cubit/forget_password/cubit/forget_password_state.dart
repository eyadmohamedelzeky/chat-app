part of 'forget_password_cubit.dart';
abstract class ForgetPasswordState {
  const ForgetPasswordState();
}
class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {}
class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  ForgetPasswordError({required this.error});
}
