import 'dart:convert';

// import 'package:explore/models/data_model';
import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = 'https://restcountries.com/v3.1/all';
  // final String baseUrl = 'https://restfulcountries.com/api/v1';
  // final String token = '2142|fy1M8OOkHBjiMADVmzdBxYLecBZ4LnnZB2azwKTd';

  Future<List<CountryData>?> fetchCountryData() async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.get(url, headers: {
        // "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        List<dynamic> data = jsonData;
        return data.map((json) => CountryData.fromJson(json)).toList();
      } else {
        debugPrint("Error: ${response.statusCode}");

        return null;
      }
    } catch (e) {
      debugPrint("Error $e");
      Get.snackbar("Error", "Failed to fetch countries. $e");
      return null;
    }
  }
}
