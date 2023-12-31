// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAu6TL1k4C-9OFCh1QbGYA6xPukZGb9Jqg',
    appId: '1:463905783853:web:582aeb299c9f899e4a38a4',
    messagingSenderId: '463905783853',
    projectId: 'chat-app-53dac',
    authDomain: 'chat-app-53dac.firebaseapp.com',
    storageBucket: 'chat-app-53dac.appspot.com',
    measurementId: 'G-2HVD8GQDK0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7xnrV9g9iz6hly6LaF5-K_9Z4sEKGWqs',
    appId: '1:463905783853:android:b85fdf366fda05ff4a38a4',
    messagingSenderId: '463905783853',
    projectId: 'chat-app-53dac',
    storageBucket: 'chat-app-53dac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCYsB2ViisiqK844rdFX_x_pI5n2sGJbk',
    appId: '1:463905783853:ios:45da81f4a9eb547e4a38a4',
    messagingSenderId: '463905783853',
    projectId: 'chat-app-53dac',
    storageBucket: 'chat-app-53dac.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCYsB2ViisiqK844rdFX_x_pI5n2sGJbk',
    appId: '1:463905783853:ios:a5e644ac5e37624d4a38a4',
    messagingSenderId: '463905783853',
    projectId: 'chat-app-53dac',
    storageBucket: 'chat-app-53dac.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
