import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart' deferred as App;

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final Future<void>? loadedLibrary = await App.loadLibrary();
  runApp(FutureBuilder(
    future: loadedLibrary,
    builder: (snapshot, context) => App.FriendlyEatsApp(),
  ));
}
