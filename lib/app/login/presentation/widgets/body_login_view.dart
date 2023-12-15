import 'package:chat_app/app/login/presentation/widgets/forget_password_row.dart';
import 'package:chat_app/app/login/presentation/widgets/index.dart';
import 'package:chat_app/app/login/presentation/widgets/register_row_widget.dart';
import 'package:flutter/material.dart';

class BodyLoginView extends StatelessWidget {
  const BodyLoginView({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
        builder: (context, state) {
          final loginCubit = BlocProvider.of<LoginScreenCubit>(context);
          return Column(children: [
            Image.asset(
              MyAssets.images.png.chatLogo.path,
            ).animate(
                autoPlay: true,
                delay: Duration(
                  seconds: 3,
                ),
                effects: [ScaleEffect()]),
            Text(
              context.localization.login,
              style: TextStyle(color: Colors.black, fontSize: 25.sp),
            ).animate(
                autoPlay: true,
                delay: Duration(
                  seconds: 3,
                ),
                effects: [
                  ScaleEffect(),
                ]),
            CustomTextFormField(
              onChanged: (val) => loginCubit.emailController.text = val!,
              validator: (value) {
                if (BlocProvider.of<VaildEmailCubit>(context)
                    .isValidEmail(value!)) {
                  return null;
                }
                return context.localization.email_empty;
              },
              textEditingController: loginCubit.emailController,
              labelText: context.localization.email,
              hintText: context.localization.hint_email,
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<VisiablePasswordCubit, VisiablePasswordState>(
              builder: (context, state) {
                final visiablePassword =
                    BlocProvider.of<VisiablePasswordCubit>(context);
                return CustomTextFormField(
                  onChanged: (value) =>
                      loginCubit.passwordController.text = value!,
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
                      icon: visiablePassword.suffixIcon,
                      onPressed: () => visiablePassword.changeVisibility()),
                  textEditingController: loginCubit.passwordController,
                  labelText: context.localization.password,
                  hintText: context.localization.hint_password,
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomRawMaterialButton(
                textButton: context.localization.login,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await loginCubit.signInUser();
                    loginCubit.state is LoginScreenSuccess
                        ? context.go(AppRouteName.homeScreen)
                        : '';
                  }
                }),
            ForgetPasswordRow(),
            RegisterRowWidget(),
          ]);
        },
      ),
    );
  }
}
