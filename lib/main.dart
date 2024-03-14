import 'package:dbminer/module/views/category/screens/category.dart';
import 'package:dbminer/module/views/favorite/screens/favorite.dart';
import 'package:dbminer/module/views/homepage/screens/homepage.dart';
import 'package:dbminer/module/views/onescreen/screen/onescreen.dart';
import 'package:dbminer/module/views/splash/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/category', page: () => Category()),
        GetPage(name: '/one', page: () => OneScreen()),
        GetPage(name: '/favorite', page: () => Favorite()),
      ],
    );
  }
}
