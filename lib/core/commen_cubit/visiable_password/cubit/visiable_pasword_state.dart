part of 'visiable_pasword_cubit.dart';

abstract class VisiablePasswordState {
  const VisiablePasswordState();
}

class VisiablepasswordInitial extends VisiablePasswordState {}

class VisiablepasswordSuccess extends VisiablePasswordState {}

class VisiablepasswordFailure extends VisiablePasswordState {}
