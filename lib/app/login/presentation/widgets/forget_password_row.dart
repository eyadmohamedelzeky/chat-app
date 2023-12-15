import 'package:chat_app/app/login/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            context.go(AppRouteName.forgetPasswordScreen);
          },
          child: Text(
            context.localization.forgot_password,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
