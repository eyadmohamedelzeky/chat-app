import 'package:bloc/bloc.dart';
part 'vaild_email_state.dart';

class VaildEmailCubit extends Cubit<VaildEmailState> {
  VaildEmailCubit() : super(VaildEmailInitial());
   bool isValidEmail(String value) {
    // Basic email validation using regex
    const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    return RegExp(emailRegex).hasMatch(value);
  }
}
