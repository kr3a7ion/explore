import 'package:get/get.dart';

class FilterController extends GetxController {
  bool isContinentExpanded = false;
  bool isTimeZoneExpanded = false;

  final List<String> continents = [
    "Africa",
    "Antarctica",
    "Asia",
    "Australia",
    "Europe",
    "North America",
    "South America"
  ];

  final List<String> timeZones = [
    "GMT+1:00",
    "GMT+2:00",
    "GMT+3:00",
    "GMT+4:00",
    "GMT+5:00"
  ];

  Set<String> selectedContinents = {};
  Set<String> selectedTimeZones = {};

  void toggleContinent() {
    isContinentExpanded = !isContinentExpanded;
    update();
  }

  void toggleTimeZone() {
    isTimeZoneExpanded = !isTimeZoneExpanded;
    update();
  }

  void toggleContinentSelection(String continent) {
    if (selectedContinents.contains(continent)) {
      selectedContinents.remove(continent);
    } else {
      selectedContinents.add(continent);
    }
    update();
  }

  void toggleTimeZoneSelection(String timeZone) {
    if (selectedTimeZones.contains(timeZone)) {
      selectedTimeZones.remove(timeZone);
    } else {
      selectedTimeZones.add(timeZone);
    }
    update();
  }

  void resetFilters() {
    selectedContinents.clear();
    selectedTimeZones.clear();
    update();
  }
}
