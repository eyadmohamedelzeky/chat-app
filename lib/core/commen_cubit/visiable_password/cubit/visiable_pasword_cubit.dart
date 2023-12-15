import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'visiable_pasword_state.dart';

class VisiablePasswordCubit extends Cubit<VisiablePasswordState> {
  VisiablePasswordCubit() : super(VisiablepasswordInitial());
  Widget suffixIcon = const Icon(Icons.visibility_off_outlined);
  bool obscureText = true;

  void changeVisibility() {
    obscureText = !obscureText;
    debugPrint('The Obscure Text Is $obscureText');
    suffixIcon = obscureText
        ? const Icon(
            Icons.visibility_off_outlined,
          )
        : const Icon(Icons.remove_red_eye_outlined);
    emit(VisiablepasswordSuccess());
  }
}