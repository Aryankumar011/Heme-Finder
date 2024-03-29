// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// / Default [FirebaseOptions] for use with your Firebase apps.
// /
// / Example:
// / ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
// / ```
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
    apiKey: 'AIzaSyDiVTVY-CLrNcJbaN4rWQs3YomWQlydwUQ',
    appId: '1:796635902916:web:8c0193ae6cfba9d43eaa91',
    messagingSenderId: '796635902916',
    projectId: 'home-finder-new',
    authDomain: 'home-finder-new.firebaseapp.com',
    storageBucket: 'home-finder-new.appspot.com',
    measurementId: 'G-F7GR6GW5JY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR0jllzHAr7L_-4cOoi_QhZUjMtQFIcak',
    appId: '1:796635902916:android:26ba3e292e4322b23eaa91',
    messagingSenderId: '796635902916',
    projectId: 'home-finder-new',
    storageBucket: 'home-finder-new.appspot.com',
  );
}
