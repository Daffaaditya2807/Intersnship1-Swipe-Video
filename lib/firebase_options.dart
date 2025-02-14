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
    apiKey: 'AIzaSyDo4AsgYV4V1u41Rs21EsHG_AKNMfOGFPg',
    appId: '1:1086811319426:web:b9e3daa6bca8a25af6589b',
    messagingSenderId: '1086811319426',
    projectId: 'intership-test1',
    authDomain: 'intership-test1.firebaseapp.com',
    databaseURL: 'https://intership-test1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'intership-test1.appspot.com',
    measurementId: 'G-VXRGVLQTWY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-DEUqHemHyufUQbes8fiFxNqgt6B5npA',
    appId: '1:1086811319426:android:c456c2a6ef837b59f6589b',
    messagingSenderId: '1086811319426',
    projectId: 'intership-test1',
    databaseURL: 'https://intership-test1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'intership-test1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO0K-43TzalXlG-2qLiK4J-NDTIsUEUMs',
    appId: '1:1086811319426:ios:c46af5fdb9401ca1f6589b',
    messagingSenderId: '1086811319426',
    projectId: 'intership-test1',
    databaseURL: 'https://intership-test1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'intership-test1.appspot.com',
    iosClientId: '1086811319426-8rdh081m6sr4inn0rbp68gdldassh2rd.apps.googleusercontent.com',
    iosBundleId: 'com.example.swipeVidio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO0K-43TzalXlG-2qLiK4J-NDTIsUEUMs',
    appId: '1:1086811319426:ios:c46af5fdb9401ca1f6589b',
    messagingSenderId: '1086811319426',
    projectId: 'intership-test1',
    databaseURL: 'https://intership-test1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'intership-test1.appspot.com',
    iosClientId: '1086811319426-8rdh081m6sr4inn0rbp68gdldassh2rd.apps.googleusercontent.com',
    iosBundleId: 'com.example.swipeVidio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDo4AsgYV4V1u41Rs21EsHG_AKNMfOGFPg',
    appId: '1:1086811319426:web:75b2fe884af6ef8bf6589b',
    messagingSenderId: '1086811319426',
    projectId: 'intership-test1',
    authDomain: 'intership-test1.firebaseapp.com',
    databaseURL: 'https://intership-test1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'intership-test1.appspot.com',
    measurementId: 'G-HQJE1NZH5V',
  );
}
