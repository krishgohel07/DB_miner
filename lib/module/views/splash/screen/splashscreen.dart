import 'dart:async';

import 'package:dbminer/module/helper/apihelper/apihelper.dart';
import 'package:dbminer/module/views/splash/controller/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(Splashcontroller());
    return Scaffold(
        body: Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://play-lh.googleusercontent.com/T5jQVjQgFXDv4A3hmke8vzrosCgSVK9mKeGhtbK246OVn1mUELYSEbR-grY2DW5nS4E'),fit: BoxFit.cover)),
      ),
    ));
  }
}
