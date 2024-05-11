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
    apiKey: 'AIzaSyBjxRwKDeMau4r-1vKEEGgZlWbPs1kJtYA',
    appId: '1:179654948084:web:352d4672a8dacd0f645aa1',
    messagingSenderId: '179654948084',
    projectId: 'auth-acdf0',
    authDomain: 'auth-acdf0.firebaseapp.com',
    storageBucket: 'auth-acdf0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3e7p4DEHGrRDH1q0rEQ6FkJf367HM6S4',
    appId: '1:179654948084:android:fdc4663a3a497eba645aa1',
    messagingSenderId: '179654948084',
    projectId: 'auth-acdf0',
    storageBucket: 'auth-acdf0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBvrtnyu2EjDb4vcaI0M24MTH_4GwrKBk',
    appId: '1:179654948084:ios:959a2e20dac56c35645aa1',
    messagingSenderId: '179654948084',
    projectId: 'auth-acdf0',
    storageBucket: 'auth-acdf0.appspot.com',
    iosBundleId: 'com.example.authapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBvrtnyu2EjDb4vcaI0M24MTH_4GwrKBk',
    appId: '1:179654948084:ios:7bcabfa4cae8ddeb645aa1',
    messagingSenderId: '179654948084',
    projectId: 'auth-acdf0',
    storageBucket: 'auth-acdf0.appspot.com',
    iosBundleId: 'com.example.authapp.RunnerTests',
  );
}
