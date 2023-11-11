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
    apiKey: 'AIzaSyB1hFnZtP-7BiPFDQTGhKMLulAGQ8jC-wY',
    appId: '1:821542283157:web:af6d433fa7ea924a20789c',
    messagingSenderId: '821542283157',
    projectId: 'furnday-15bd6',
    authDomain: 'furnday-15bd6.firebaseapp.com',
    storageBucket: 'furnday-15bd6.appspot.com',
    measurementId: 'G-38C19HDPS7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsal8L742RlUQgfxwLWjTVAasw8uCFbuU',
    appId: '1:821542283157:android:6c34f4192006100920789c',
    messagingSenderId: '821542283157',
    projectId: 'furnday-15bd6',
    storageBucket: 'furnday-15bd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIn1ljS0GsErsiC_GAIV1o2mW9aCnX7uk',
    appId: '1:821542283157:ios:f99c231302a9be3520789c',
    messagingSenderId: '821542283157',
    projectId: 'furnday-15bd6',
    storageBucket: 'furnday-15bd6.appspot.com',
    androidClientId: '821542283157-64gh4ljvpuo0fgsmgm9h1mjblik2tcin.apps.googleusercontent.com',
    iosClientId: '821542283157-vn1o28dq35bin591fu8uk9nllam4d57n.apps.googleusercontent.com',
    iosBundleId: 'com.furnday.furndayseller.furndayseller',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIn1ljS0GsErsiC_GAIV1o2mW9aCnX7uk',
    appId: '1:821542283157:ios:75da073e809f43a320789c',
    messagingSenderId: '821542283157',
    projectId: 'furnday-15bd6',
    storageBucket: 'furnday-15bd6.appspot.com',
    androidClientId: '821542283157-64gh4ljvpuo0fgsmgm9h1mjblik2tcin.apps.googleusercontent.com',
    iosClientId: '821542283157-471d4auqm5tlf7ea0pu3a5odbfoqi6ss.apps.googleusercontent.com',
    iosBundleId: 'com.furnday.furndayseller.furndayseller.RunnerTests',
  );
}
