import 'package:fitbadmin/app.dart';
import 'package:fitbadmin/di/di_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool authenticated = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDi();
  runApp(MyApp());
}
