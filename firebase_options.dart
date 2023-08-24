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
    apiKey: 'AIzaSyA9cChODefB-Vt-GPvJBq7yU2sFUQwb8Wo',
    appId: '1:144228948144:web:aa4f4f18b8d300d3cdc375',
    messagingSenderId: '144228948144',
    projectId: 'egarage-eb18f',
    authDomain: 'egarage-eb18f.firebaseapp.com',
    storageBucket: 'egarage-eb18f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABQP8i4e5ZKtisc3M2i3nYCCGoNUGHJVY',
    appId: '1:144228948144:android:20753b44153537f0cdc375',
    messagingSenderId: '144228948144',
    projectId: 'egarage-eb18f',
    storageBucket: 'egarage-eb18f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3BntP-jW-XWwvZbIs8K7DbD2wXtnW8lI',
    appId: '1:144228948144:ios:366bb2a896acf723cdc375',
    messagingSenderId: '144228948144',
    projectId: 'egarage-eb18f',
    storageBucket: 'egarage-eb18f.appspot.com',
    androidClientId: '144228948144-0chrukguv8l5fbtof9m7p0f05tcm238r.apps.googleusercontent.com',
    iosClientId: '144228948144-lu6rhc05p83rfo0u3h5gopnnnrisafa0.apps.googleusercontent.com',
    iosBundleId: 'com.example.egarage',
  );
}
