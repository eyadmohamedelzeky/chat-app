import 'dart:async';
import 'package:chat_app/app/splash/presentation/widgets/body_splash_view.dart';
import 'package:chat_app/config/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    Timer(
        Duration(seconds: 6), () => context.goNamed(AppRouteName.loginScreen));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BodySplashView(),
      ),
    );
  }
}
