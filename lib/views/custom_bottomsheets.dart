import 'package:explore/views/controllers/language_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLanguageBottomSheet() {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Get.theme.bottomSheetTheme.backgroundColor ??
            Get.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Languages",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () => Get.back(),
              )
            ],
          ),

          // Language List
          Expanded(
            child: GetBuilder<LanguageController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.languages.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(controller.languages[index],
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    value: controller.languages[index],
                    groupValue: controller.selectedLanguage.value,
                    activeColor: Get.isDarkMode ? Colors.white : Colors.black,
                    onChanged: (value) {
                      controller.setLanguage(value!);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
