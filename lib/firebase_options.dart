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
    apiKey: 'AIzaSyAOkF4RoUlt8-V_bPhSMxnWfm-cblOnCMc',
    appId: '1:52877239156:web:e59b4c023669ce75234221',
    messagingSenderId: '52877239156',
    projectId: 'aaplelaadoo-3510d',
    authDomain: 'aaplelaadoo-3510d.firebaseapp.com',
    storageBucket: 'aaplelaadoo-3510d.appspot.com',
    measurementId: 'G-E1DCP529E4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfbtOZE8eq06_N-GjSsPjItEbf2uaYX3g',
    appId: '1:52877239156:android:54b4cc3059c45b9c234221',
    messagingSenderId: '52877239156',
    projectId: 'aaplelaadoo-3510d',
    storageBucket: 'aaplelaadoo-3510d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBl5uZQjsmqfimubARL3cUvkuxOwfS7sGI',
    appId: '1:52877239156:ios:c2ee8c7bbcc45794234221',
    messagingSenderId: '52877239156',
    projectId: 'aaplelaadoo-3510d',
    storageBucket: 'aaplelaadoo-3510d.appspot.com',
    iosBundleId: 'com.example.AapleLaadoo',
  );
}
