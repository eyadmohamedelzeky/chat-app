import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterScreenInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> registerUser() async {
    try {
      emit(RegisterScreenLoading());
      final auth = FirebaseAuth.instance;
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(RegisterScreenSuccess());
      Fluttertoast.showToast(
          msg: 'Register Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint(
        "This Email is${userCredential.user!.email}",
      );
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(messageError: e.code));
      debugPrint('The error is ${e.code}');
      String errorMessage = 'An error occurred';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
        debugPrint('errorMessage is ${errorMessage}');
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
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
