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
    apiKey: 'AIzaSyBWEbLDfLzodRrDlv80J_EcQcDF369USDI',
    appId: '1:433091418944:web:2f39423e2c82c630f078a5',
    messagingSenderId: '433091418944',
    projectId: 'college-sports-app',
    authDomain: 'college-sports-app.firebaseapp.com',
    storageBucket: 'college-sports-app.appspot.com',
    measurementId: 'G-9BZQQY17K9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD75-koogxVVEW-mH3DS2kaVJBqZaLoSKc',
    appId: '1:433091418944:android:565828939b4f9f1af078a5',
    messagingSenderId: '433091418944',
    projectId: 'college-sports-app',
    storageBucket: 'college-sports-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASLYcR4YOexetUgXxuhV-RysH2ef26fi0',
    appId: '1:433091418944:ios:2e048c03e57f16eaf078a5',
    messagingSenderId: '433091418944',
    projectId: 'college-sports-app',
    storageBucket: 'college-sports-app.appspot.com',
    iosBundleId: 'com.example.alvasSports',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASLYcR4YOexetUgXxuhV-RysH2ef26fi0',
    appId: '1:433091418944:ios:2e048c03e57f16eaf078a5',
    messagingSenderId: '433091418944',
    projectId: 'college-sports-app',
    storageBucket: 'college-sports-app.appspot.com',
    iosBundleId: 'com.example.alvasSports',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWEbLDfLzodRrDlv80J_EcQcDF369USDI',
    appId: '1:433091418944:web:c7a9d653e47b6720f078a5',
    messagingSenderId: '433091418944',
    projectId: 'college-sports-app',
    authDomain: 'college-sports-app.firebaseapp.com',
    storageBucket: 'college-sports-app.appspot.com',
    measurementId: 'G-6M2YYQZ8RG',
  );
}