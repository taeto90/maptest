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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAfd6WF8Xn3mKhKI6etUH1Uk6CBKyf3LOA',
    appId: '1:5839006646:web:fcc8cc09b071346a6baf17',
    messagingSenderId: '5839006646',
    projectId: 'sql-python-firebase',
    authDomain: 'sql-python-firebase.firebaseapp.com',
    databaseURL: 'https://sql-python-firebase-default-rtdb.firebaseio.com',
    storageBucket: 'sql-python-firebase.appspot.com',
    measurementId: 'G-4BZ7S62YY4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvBVwpGNK8bT1qTHx9ieEKEycu4Y1qjII',
    appId: '1:5839006646:android:18dfc3649c1400fb6baf17',
    messagingSenderId: '5839006646',
    projectId: 'sql-python-firebase',
    databaseURL: 'https://sql-python-firebase-default-rtdb.firebaseio.com',
    storageBucket: 'sql-python-firebase.appspot.com',
  );
}
