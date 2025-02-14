import 'package:explore/common/widgets/custom_outlinedbutton.dart';
import 'package:explore/common/widgets/custom_searchbar.dart';
import 'package:explore/models/country_model.dart';
import 'package:explore/theme/controller/theme_controller.dart';
import 'package:explore/theme/themes.dart';
import 'package:explore/utilities/country_controller.dart';
import 'package:explore/views/controllers/language_controllers.dart';
import 'package:explore/views/country_detail_page.dart';
import 'package:explore/views/custom_bottomsheets.dart';
import 'package:explore/views/custom_filter_buttomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController themeController = Get.find();
  final CountryController countryController = Get.find();
  final LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Explore',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  themeController.toggleMode();
                },
                icon: themeController.isDarkMode.value
                    ? CircleAvatar(
                        backgroundColor:
                            AppColors.darkmodeBackgroundColorlighter,
                        child: Icon(
                          Icons.nightlight_rounded,
                          color: Colors.white,
                        ),
                      )
                    : Icon(Icons.light_mode_outlined)),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 10),
              customSearchBar(
                  theTextController: countryController.theSearchTextController,
                  suffiixonPressed: () {
                    countryController.searchQuery.value =
                        ''; // Clear search query
                    countryController.theSearchTextController
                        .clear(); // Clear TextField input
                  },
                  theSuffixIcon: Obx(() =>
                      countryController.searchQuery.isNotEmpty
                          ? Icon(Icons.clear)
                          : SizedBox.shrink()),
                  onchanged: (value) {
                    countryController.searchQuery.value = value;
                  },
                  searchFillColor: AppColors.darkmodeBackgroundColorlighter),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customOutlinedButton(
                      useIcon: false,
                      theButtonText: 'EN',
                      imagePath: themeController.isDarkMode.value
                          ? 'assets/images/globeb.png'
                          : 'assets/images/globew.png',
                      onPressed: () {
                        showLanguageBottomSheet();
                        // countryController.fetchCountries();
                      }),
                  customOutlinedButton(
                      theWidth: 86,
                      useIcon: true,
                      theIconPath: IconlyLight.filter_2,
                      theButtonText: 'Filter',
                      onPressed: () {
                        showFilterBottomSheet();
                      })
                ],
              ),
              SizedBox(height: 20),
              Obx(() {
                if (countryController.isLoading.value) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else if (countryController.groupedCountries.isEmpty) {
                  return Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 200),
                      Text('No Country Found'),
                      customOutlinedButton(
                        theWidth: 120,
                        theButtonText: 'Reload',
                        useIcon: true,
                        onPressed: () {
                          countryController.fetchCountries();
                        },
                        theIconPath: Icons.replay_circle_filled_outlined,
                        theiconSize: 25,
                      )
                    ],
                  ));
                } else if (countryController.searchQuery.value.isNotEmpty) {
                  // Show search results
                  var results = countryController.filteredCountries;
                  return results.isEmpty
                      ? Center(child: Text("No countries found"))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: results.length,
                            itemBuilder: (context, index) {
                              var country = results[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      CountryDetailsPage(country: country));
                                },
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      country.flags['png']!,
                                      fit: BoxFit.fill,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  title: Text(country.countryName),
                                  subtitle: Text(country.capital.isEmpty
                                      ? 'null'
                                      : country.capital.join(', ')),
                                ),
                              );
                            },
                          ),
                        );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: countryController.groupedCountries.length,
                      itemBuilder: (context, index) {
                        String letter = countryController.groupedCountries.keys
                            .elementAt(index);
                        List<CountryData> countryList =
                            countryController.groupedCountries[letter]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                letter,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            ...countryList.map(
                              (CountryData country) => GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      CountryDetailsPage(country: country));
                                },
                                child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        country.flags['png']!,
                                        fit: BoxFit.fill,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    title: Text(country.countryName),
                                    subtitle: Text(
                                      country.capital.isEmpty
                                          ? 'null'
                                          : country.capital.join(', '),
                                    )),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
