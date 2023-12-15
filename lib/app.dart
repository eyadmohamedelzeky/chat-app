import 'package:chat_app/app/login/presentation/cubit/login_cubit.dart';
import 'package:chat_app/app/register/presentation/cubit/register_cubit.dart';
import 'package:chat_app/config/app_route.dart';
import 'package:chat_app/core/commen_cubit/vaild_email/cubit/vaild_email_cubit.dart';
import 'package:chat_app/core/commen_cubit/visiable_password/cubit/visiable_pasword_cubit.dart';
import 'package:chat_app/core/localization/generated/l10n.dart';
import 'package:chat_app/core/localization/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginScreenCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => VaildEmailCubit(),
        ),
        BlocProvider(
          create: (context) => VisiablePasswordCubit(),
        ),
        // BlocProvider(
        //   create: (context) => ForgetPasswordCubit(),
        // ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LocalizationHelper.supportedLocales,
        ),
      ),
    );
  }
}
