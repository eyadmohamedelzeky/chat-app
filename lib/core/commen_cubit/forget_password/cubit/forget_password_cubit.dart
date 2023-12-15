import 'package:chat_app/app/login/presentation/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  final TextEditingController passwordResetEmailController =
      TextEditingController();
  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());

    try {
      if (passwordResetEmailController.text.isEmpty) {
        return emit(ForgetPasswordError(error: 'Email cannot be empty'));
      } else if (passwordResetEmailController.text == 'invalid email') {
        return emit(ForgetPasswordError(error: 'Invalid Email'));
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: passwordResetEmailController.text);
        
        emit(ForgetPasswordSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordError(error: e.message!));
      Lottie.asset(MyAssets.lottie.fail.path);
      debugPrint('The Error from Forget Password is ${e.message}');
    }
  }
}
