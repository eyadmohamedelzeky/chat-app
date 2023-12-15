import 'package:chat_app/app/register/presentation/cubit/register_cubit.dart';
import 'package:chat_app/app/register/presentation/widgets/register_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RegisterBodyView(formKey: formKey),
      ),
    );
  }
}
