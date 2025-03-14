import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDk7D_WmGEAM45A_TGxAry-DRq5DHVDqXU",
            authDomain: "dark-store2-59fxao.firebaseapp.com",
            projectId: "dark-store2-59fxao",
            storageBucket: "dark-store2-59fxao.appspot.com",
            messagingSenderId: "428828758760",
            appId: "1:428828758760:web:3c09c935cf35ef0fdd2f5d"));
  } else {
    await Firebase.initializeApp();
  }
}
