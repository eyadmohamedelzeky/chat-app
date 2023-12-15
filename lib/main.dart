import 'package:chat_app/app.dart';
import 'package:chat_app/bloc_observer.dart';
import 'package:chat_app/core/di/di.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
