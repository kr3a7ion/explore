import 'package:explore/views/controllers/filer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showFilterBottomSheet() {
  Get.bottomSheet(
    GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Get.theme.iconTheme.color),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Continent Section
              _buildExpandableSection(
                title: "Continent",
                items: controller.continents,
                expanded: controller.isContinentExpanded,
                onToggle: controller.toggleContinent,
                selectedItems: controller.selectedContinents,
                onItemTap: controller.toggleContinentSelection,
              ),

              const SizedBox(height: 8),

              // Time Zone Section
              _buildExpandableSection(
                title: "Time Zone",
                items: controller.timeZones,
                expanded: controller.isTimeZoneExpanded,
                onToggle: controller.toggleTimeZone,
                selectedItems: controller.selectedTimeZones,
                onItemTap: controller.toggleTimeZoneSelection,
              ),

              const SizedBox(height: 16),

              // Reset & Show Results Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    onPressed: controller.resetFilters,
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Get.theme.bottomSheetTheme.backgroundColor ??
                              Get.theme.scaffoldBackgroundColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Get.back(); // Close bottom sheet
                        // Perform filter action here
                      },
                      child: Text("Show results", style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

// Expandable section for Continent & Time Zone
Widget _buildExpandableSection({
  required String title,
  required List<String> items,
  required bool expanded,
  required VoidCallback onToggle,
  required Set<String> selectedItems,
  required Function(String) onItemTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onToggle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(expanded ? Icons.expand_less : Icons.expand_more),
          ],
        ),
      ),
      if (expanded)
        Column(
          children: items.map((item) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                item,
              ),
              value: selectedItems.contains(item),
              onChanged: (_) => onItemTap(item),
              activeColor: Colors.black,
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }).toList(),
        ),
    ],
  );
}
