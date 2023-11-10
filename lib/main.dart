import 'package:e_ommerce_app/view/home.dart';
import 'package:e_ommerce_app/view/login_and_reg/login.dart';
import 'package:e_ommerce_app/view/product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCd-0D58lkw8N5Onvliw8L-yrQwOCpAG9Y", 
      appId: "1:54123056971:android:9da3ca730a20d39a6da2ce", 
      messagingSenderId: '', 
      projectId: "e-commerce-655b3")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: user == null ? LoginPage() : BottomNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}

