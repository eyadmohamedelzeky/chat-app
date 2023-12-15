import 'package:chat_app/core/localization/localization.dart';
import 'package:chat_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodySplashView extends StatelessWidget {
  const BodySplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(MyAssets.images.png.chatLogo.path).animate(
          autoPlay: true,
          delay: Duration(
            seconds: 3,
          ),
          effects: [ScaleEffect()],
        ),
        Text(
          context.localization.chat_app,
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ).animate(
            autoPlay: true,
            delay: Duration(
              seconds: 4,
            ),
            effects: [ShakeEffect()])
      ]),
    );
  }
}