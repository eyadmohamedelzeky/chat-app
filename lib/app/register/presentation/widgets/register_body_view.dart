import 'package:chat_app/app/register/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

class RegisterBodyView extends StatelessWidget {
  const RegisterBodyView({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  final registerCubit =
                      BlocProvider.of<RegisterCubit>(context);
                  return Column(children: [
                    Image.asset(MyAssets.images.png.chatLogo.path),
                    Text(context.localization.register,
                        style: TextStyle(
                            color: Colors.black, fontSize: 25.sp)),
                    CustomTextFormField(
                      onChanged: (val) {
                        registerCubit.emailController.text = val!;
                      },
                      validator: (value) {
                        if (BlocProvider.of<VaildEmailCubit>(context)
                            .isValidEmail(value!)) {
                          return null;
                        }
                        return context.localization.email_empty;
                      },
                      textEditingController: registerCubit.emailController,
                      labelText: context.localization.email,
                      hintText: context.localization.hint_email,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    BlocBuilder<VisiablePasswordCubit,
                        VisiablePasswordState>(
                      builder: (context, state) {
                        final visiablePassword =
                            BlocProvider.of<VisiablePasswordCubit>(context);
                        return CustomTextFormField(
                          onChanged: (value) {
                            registerCubit.passwordController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return context.localization.password_empty;
                            } else if (value.length < 8) {
                              return context.localization.short_password;
                            }
                            return null;
                          },
                          obscureText: visiablePassword.obscureText,
                          suffixIcon: IconButton(
                              onPressed: () {
                                visiablePassword.changeVisibility();
                              },
                              icon: visiablePassword.suffixIcon),
                          textEditingController:
                              registerCubit.passwordController,
                          labelText: context.localization.password,
                          hintText: context.localization.hint_password,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRawMaterialButton(
                        textButton: context.localization.register,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await registerCubit.registerUser();
                            state is RegisterScreenSuccess
                                ? context.go(AppRouteName.loginScreen)
                                : '';
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.localization.already_have_account,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.push(AppRouteName.loginScreen),
                          child: Text(
                            context.localization.login,
                            style: TextStyle(
                                color: Colors.blue, fontSize: 15.sp),
                          ),
                        )
                      ],
                    )
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}