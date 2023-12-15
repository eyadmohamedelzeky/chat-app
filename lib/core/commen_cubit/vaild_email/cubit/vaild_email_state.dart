part of 'vaild_email_cubit.dart';
abstract class VaildEmailState  {}
class VaildEmailInitial extends VaildEmailState {}
class VaildEmailSuccess extends VaildEmailState {}
class VaildEmailError extends VaildEmailState {
  final String error;
  VaildEmailError({required this.error});
}
