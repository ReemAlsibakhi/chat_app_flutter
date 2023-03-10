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
    apiKey: 'AIzaSyCH2iYYfRNNm8puj9Vn9VmqpCQAVGWYJD4',
    appId: '1:494051556145:web:f3869b4572a1fea4d54e10',
    messagingSenderId: '494051556145',
    projectId: 'add-fb-flutter',
    authDomain: 'add-fb-flutter.firebaseapp.com',
    storageBucket: 'add-fb-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyWycwQw9ABsz5fWXvQgKgJOjwmBTWrRs',
    appId: '1:494051556145:android:8087eef6de139e20d54e10',
    messagingSenderId: '494051556145',
    projectId: 'add-fb-flutter',
    storageBucket: 'add-fb-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfYvbCQqYWNkEkbNKQH5qXzX1QMOboEi0',
    appId: '1:494051556145:ios:a29298d31f720049d54e10',
    messagingSenderId: '494051556145',
    projectId: 'add-fb-flutter',
    storageBucket: 'add-fb-flutter.appspot.com',
    iosClientId: '494051556145-8anouttufgcreob0gisc9d5f5gi0na9v.apps.googleusercontent.com',
    iosBundleId: 'com.oalshokri.chatAppClass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfYvbCQqYWNkEkbNKQH5qXzX1QMOboEi0',
    appId: '1:494051556145:ios:a29298d31f720049d54e10',
    messagingSenderId: '494051556145',
    projectId: 'add-fb-flutter',
    storageBucket: 'add-fb-flutter.appspot.com',
    iosClientId: '494051556145-8anouttufgcreob0gisc9d5f5gi0na9v.apps.googleusercontent.com',
    iosBundleId: 'com.oalshokri.chatAppClass',
  );
}
