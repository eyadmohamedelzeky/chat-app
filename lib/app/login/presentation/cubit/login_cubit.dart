import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'login_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> signInUser() async {
    try {
      emit(LoginScreenLoading());
      final auth = FirebaseAuth.instance;
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Fluttertoast.showToast(
          msg: 'Login Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginScreenSuccess());
      
      debugPrint(
        "This Email is${userCredential.user!.email}",
      );
    } on FirebaseAuthException catch (e) {
      emit(LoginScreenError(message: e.code));
      debugPrint('The error is ${e.code}');
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email and try again.';
        debugPrint('errorMessage is ${errorMessage}');
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
        debugPrint('errorMessage is ${errorMessage}');
      } else if (e.code == 'invalid-email') {
        errorMessage =
            'Invalid email format. Please enter a valid email address.';
        debugPrint('errorMessage is ${errorMessage}');
      } else {
        errorMessage = e.message ?? 'An unknown error occurred';
        debugPrint('errorMessage is ${errorMessage}');
      }
      Fluttertoast.showToast(
          msg: e.code,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
