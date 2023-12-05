import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyALQXgGGv8kQeuSlkakDaKQSZx51IfSg7c",
            authDomain: "laughingstockman-psn.firebaseapp.com",
            projectId: "laughingstockman-psn",
            storageBucket: "laughingstockman-psn.appspot.com",
            messagingSenderId: "592534739531",
            appId: "1:592534739531:web:de0a01cdff793525f48bce"));
  } else {
    await Firebase.initializeApp();
  }
}
