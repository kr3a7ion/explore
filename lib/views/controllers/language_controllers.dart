import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "English".obs; // Default language

  List<String> languages = [
    "Bahasa",
    "Deutsch",
    "English",
    "Español",
    "Française",
    "Italiano",
    "Português",
    "Русский",
    "Svenska",
    "Türkçe",
    "普通话",
    "بالعربية",
    "বাংলা"
  ].obs;

  void setLanguage(String language) {
    selectedLanguage.value = language;
    update();
  }
}
