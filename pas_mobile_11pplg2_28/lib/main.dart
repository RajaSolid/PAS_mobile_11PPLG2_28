import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/routes/pages.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Tambahkan ini biar SharedPreferences siap digunakan
  await SharedPreferences.getInstance();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
