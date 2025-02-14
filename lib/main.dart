import 'package:explore/theme/controller/theme_controller.dart';
import 'package:explore/theme/themes.dart';
import 'package:explore/utilities/country_controller.dart';
import 'package:explore/views/controllers/language_controllers.dart';
import 'package:explore/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized
  Get.put(ThemeController());
  Get.put(CountryController());
  Get.put(LanguageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
