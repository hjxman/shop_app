import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shop_app_mobb/pages/login.dart';
import 'package:shop_app_mobb/pages/home.dart';

// import 'package:shop_app_mobb/pages/home.dart';
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
  print("hello from anoter");
}