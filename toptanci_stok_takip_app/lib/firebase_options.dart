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
    apiKey: 'AIzaSyBR_H89iyO2Vjd-lA8wAMPqSC9MckJ-wmE',
    appId: '1:250362621858:web:bccf9f2ad44e7b351bccfb',
    messagingSenderId: '250362621858',
    projectId: 'toptancistoktakipuygulam-edf5f',
    authDomain: 'toptancistoktakipuygulam-edf5f.firebaseapp.com',
    storageBucket: 'toptancistoktakipuygulam-edf5f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcMCN_NDpgx_cP41ew5YH1NIxmGNqzq9s',
    appId: '1:250362621858:android:3f3da19e94d729fb1bccfb',
    messagingSenderId: '250362621858',
    projectId: 'toptancistoktakipuygulam-edf5f',
    storageBucket: 'toptancistoktakipuygulam-edf5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCseI9MQfQjeVeUCfVVgegVZDgOgMzFJGQ',
    appId: '1:250362621858:ios:f6980984f3ff13561bccfb',
    messagingSenderId: '250362621858',
    projectId: 'toptancistoktakipuygulam-edf5f',
    storageBucket: 'toptancistoktakipuygulam-edf5f.appspot.com',
    iosBundleId: 'com.example.toptanciStokTakipApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCseI9MQfQjeVeUCfVVgegVZDgOgMzFJGQ',
    appId: '1:250362621858:ios:f6980984f3ff13561bccfb',
    messagingSenderId: '250362621858',
    projectId: 'toptancistoktakipuygulam-edf5f',
    storageBucket: 'toptancistoktakipuygulam-edf5f.appspot.com',
    iosBundleId: 'com.example.toptanciStokTakipApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBR_H89iyO2Vjd-lA8wAMPqSC9MckJ-wmE',
    appId: '1:250362621858:web:e850ffeb636c1cd11bccfb',
    messagingSenderId: '250362621858',
    projectId: 'toptancistoktakipuygulam-edf5f',
    authDomain: 'toptancistoktakipuygulam-edf5f.firebaseapp.com',
    storageBucket: 'toptancistoktakipuygulam-edf5f.appspot.com',
  );

}