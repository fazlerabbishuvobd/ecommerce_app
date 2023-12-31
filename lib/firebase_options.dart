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
    apiKey: 'AIzaSyBu5akgu-7lO7OAHu1the3F0scYhgf_NfA',
    appId: '1:515794421165:web:81ab4b81a44e49e8d48d24',
    messagingSenderId: '515794421165',
    projectId: 'e-commerce-app-20d19',
    authDomain: 'e-commerce-app-20d19.firebaseapp.com',
    storageBucket: 'e-commerce-app-20d19.appspot.com',
    measurementId: 'G-D5K65MPJL5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASmx14Y_oleOtBENGevwVZVJfB_2hDd98',
    appId: '1:515794421165:android:230f0db5d7abbb71d48d24',
    messagingSenderId: '515794421165',
    projectId: 'e-commerce-app-20d19',
    storageBucket: 'e-commerce-app-20d19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLoCdWl5SqttEDV9kfHsIzSAiqsm59r4I',
    appId: '1:515794421165:ios:5c35746c0170add9d48d24',
    messagingSenderId: '515794421165',
    projectId: 'e-commerce-app-20d19',
    storageBucket: 'e-commerce-app-20d19.appspot.com',
    iosBundleId: 'com.fazlerabbi.ecommerce.ecommerceApp',
  );
}
