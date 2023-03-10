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
    apiKey: 'AIzaSyCBN3ZUmrCP9XuMeBs-EmjKEeOZZ-RE-40',
    appId: '1:320910624869:web:eeaebc2318ab7576089e8c',
    messagingSenderId: '320910624869',
    projectId: 'final-bti-8d297',
    authDomain: 'final-bti-8d297.firebaseapp.com',
    storageBucket: 'final-bti-8d297.appspot.com',
    measurementId: 'G-RVZDJ4L9DD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcyt4EDj-0v6gystD16HFt4Ew3TuZidsg',
    appId: '1:320910624869:android:dafebac5a35cd687089e8c',
    messagingSenderId: '320910624869',
    projectId: 'final-bti-8d297',
    storageBucket: 'final-bti-8d297.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6OUB6qw9nFpUDzM3qNPfxLDLqp1CVXkQ',
    appId: '1:320910624869:ios:51ab04fb516aaf54089e8c',
    messagingSenderId: '320910624869',
    projectId: 'final-bti-8d297',
    storageBucket: 'final-bti-8d297.appspot.com',
    iosClientId: '320910624869-hk63nnpcmd744s400v78q4p50qb0qpha.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6OUB6qw9nFpUDzM3qNPfxLDLqp1CVXkQ',
    appId: '1:320910624869:ios:51ab04fb516aaf54089e8c',
    messagingSenderId: '320910624869',
    projectId: 'final-bti-8d297',
    storageBucket: 'final-bti-8d297.appspot.com',
    iosClientId: '320910624869-hk63nnpcmd744s400v78q4p50qb0qpha.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalProject',
  );
}
