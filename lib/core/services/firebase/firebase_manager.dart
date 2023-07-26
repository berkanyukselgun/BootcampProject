import 'package:akademi_bootcamp/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseManager {
  static initilization() async {
    await Firebase.initializeApp();
    return;
  }

  builder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return const Center(child: Text("Error"));
    } else if (snapshot.hasData) {
      return MyApp();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
