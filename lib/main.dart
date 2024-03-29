import 'package:flutter/material.dart';
import 'package:mysecondapp/pages/food/popular_food_detail.dart';
import 'package:mysecondapp/pages/food/recommanded_food.dart';
import 'package:mysecondapp/pages/home/login.dart';
import 'package:mysecondapp/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
