import 'package:chat_app/app/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:chat_app/app/home/presentation/screen/home_screen.dart';
import 'package:chat_app/app/login/presentation/screens/login_screen.dart';
import 'package:chat_app/app/register/presentation/screens/register_screen.dart';
import 'package:chat_app/app/splash/presentation/screens/splash_screen.dart';
import 'package:chat_app/config/route_name.dart';
import 'package:go_router/go_router.dart';
final router = GoRouter(
  initialLocation: AppRouteName.splashScreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRouteName.splashScreen,
      name: AppRouteName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRouteName.homeScreen,
      name: AppRouteName.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRouteName.loginScreen,
      name: AppRouteName.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRouteName.registerScreen,
      name: AppRouteName.registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
     GoRoute(
      path: AppRouteName.forgetPasswordScreen,
      name: AppRouteName.forgetPasswordScreen,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
  ],
);