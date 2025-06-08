import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyANMzd_loB9d7FKUksd6XWjGyyIRZXyxu8",
            authDomain: "ch-budget.firebaseapp.com",
            projectId: "ch-budget",
            storageBucket: "ch-budget.firebasestorage.app",
            messagingSenderId: "236110493914",
            appId: "1:236110493914:web:2898f4662c5a4b03af8de3"));
  } else {
    await Firebase.initializeApp();
  }
}
