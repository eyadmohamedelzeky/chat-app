import 'package:chat_app/app/register/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

class RegisterRowWidget extends StatelessWidget {
  const RegisterRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.localization.donnot_have_account,
          style: TextStyle(fontSize: 15.sp),
        ),
        TextButton(
          onPressed: () => context.push(AppRouteName.registerScreen),
          child: Text(
            context.localization.register,
            style: TextStyle(color: Colors.blue, fontSize: 15.sp),
          ),
        )
      ],
    );
  }
}