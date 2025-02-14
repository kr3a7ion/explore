// import 'package:explore/models/data_model';
import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api_services.dart';

class CountryController extends GetxController {
  var countries = <CountryData>[].obs; // Holds all list of countries
  var groupedCountries =
      <String, List<CountryData>>{}.obs; // Holds sorted countrieis A-Z groups
  var isLoading = false.obs;
  var searchQuery = ''.obs; // Holds the search text

  final TextEditingController theSearchTextController = TextEditingController();

  final ApiServices apiService = ApiServices();

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  @override
  void dispose() {
    theSearchTextController.dispose();
    super.dispose();
  }

  // this function calls the fetch country data that handle the api
  Future<void> fetchCountries() async {
    isLoading(true);
    var response = await apiService.fetchCountryData();
    if (response != null) {
      countries.value = response;
      groupCountriesByAlphabet(); // Group after fetching
    } else {
      Get.snackbar("Error", "Failed to fetch countries.");
    }
    isLoading(false);
  }



  void groupCountriesByAlphabet() {
    // Sort countries alphabetically before grouping
    countries.sort((a, b) => a.countryName.compareTo(b.countryName));

    Map<String, List<CountryData>> tempGrouped = {};

    for (var country in countries) {
      String firstLetter = country.countryName[0].toUpperCase();
      if (!tempGrouped.containsKey(firstLetter)) {
        tempGrouped[firstLetter] = [];
      }
      tempGrouped[firstLetter]!.add(country);
    }

    // Ensure each list inside the map is sorted
    tempGrouped.forEach((key, value) {
      value.sort((a, b) => a.countryName.compareTo(b.countryName));
    });

    groupedCountries.value = tempGrouped; // Update observable map
  }


  // Function to filter countries based on search
  List<CountryData> get filteredCountries {
    if (searchQuery.value.isEmpty) {
      return countries; // Show all countries if no search
    } else {
      return countries.where((country) {
        return country.countryName
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }
}
