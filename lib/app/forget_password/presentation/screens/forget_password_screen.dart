import 'package:chat_app/app/login/presentation/widgets/index.dart';
import 'package:chat_app/core/commen_cubit/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              final forgetPasswordCubit =
                  BlocProvider.of<ForgetPasswordCubit>(context);
              return FormBuilder(
                key: formKey,
                child: ListView(padding: const EdgeInsets.all(16), children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Icon(
                    Icons.lock,
                    color: Colors.blue,
                    size: 60,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                      textEditingController:
                          forgetPasswordCubit.passwordResetEmailController,
                      labelText: context.localization.email,
                      hintText: context.localization.hint_email,
                      validator: (value) {
                        if (BlocProvider.of<VaildEmailCubit>(context)
                            .isValidEmail(value!)) {
                          return null;
                        }
                        return context.localization.email_empty;
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomRawMaterialButton(
                      textColor: Colors.blue,
                      color: Colors.white,
                      textButton: context.localization.reset_password,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await forgetPasswordCubit.forgetPassword();
                          // if (state is ForgetPasswordLoading) {
                          //   return showDialog(
                          //     context: context,
                          //     builder: (context) => Lottie.asset(
                          //       MyAssets.lottie.waiting.path,
                          //       repeat: true,
                          //       animate: true,
                          //     ),
                          //   );
                          // }
                          if (state is ForgetPasswordSuccess) {
                            return showDialog(
                              context: context,
                              builder: (context) => Lottie.asset(
                                  MyAssets.lottie.scuess.path,
                                  repeat: true,
                                  animate: true),
                            ).then((value) =>
                                context.goNamed(AppRouteName.loginScreen));
                          }
                        }
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextButton(
                      onPressed: () {
                        context.go(AppRouteName.loginScreen);
                      },
                      child: Text(
                        context.localization.go_back,
                        style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                      )),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
