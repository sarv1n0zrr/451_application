// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBAp0pmJvgogLhnNkQoMdRN87ucRigqhmI',
    appId: '1:927512766037:web:9bdbe1c132c86da38d56dc',
    messagingSenderId: '927512766037',
    projectId: 'book-app-c9774',
    authDomain: 'book-app-c9774.firebaseapp.com',
    storageBucket: 'book-app-c9774.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcZfmumyexcse2kZT-jNCN-4Bbt_CJCPw',
    appId: '1:927512766037:android:f26f9608fb82fca48d56dc',
    messagingSenderId: '927512766037',
    projectId: 'book-app-c9774',
    storageBucket: 'book-app-c9774.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWBnjyzD8EMXmdGoeQ83IeSUMZq4fzdD0',
    appId: '1:927512766037:ios:8510da9396a4ea438d56dc',
    messagingSenderId: '927512766037',
    projectId: 'book-app-c9774',
    storageBucket: 'book-app-c9774.firebasestorage.app',
    iosBundleId: 'com.example.bookApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWBnjyzD8EMXmdGoeQ83IeSUMZq4fzdD0',
    appId: '1:927512766037:ios:8510da9396a4ea438d56dc',
    messagingSenderId: '927512766037',
    projectId: 'book-app-c9774',
    storageBucket: 'book-app-c9774.firebasestorage.app',
    iosBundleId: 'com.example.bookApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBAp0pmJvgogLhnNkQoMdRN87ucRigqhmI',
    appId: '1:927512766037:web:a69ad0ff9c532f5f8d56dc',
    messagingSenderId: '927512766037',
    projectId: 'book-app-c9774',
    authDomain: 'book-app-c9774.firebaseapp.com',
    storageBucket: 'book-app-c9774.firebasestorage.app',
  );
}
