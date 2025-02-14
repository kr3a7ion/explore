import 'package:flutter/material.dart';
import 'package:explore/models/country_model.dart';

class CountryDetailsPage extends StatelessWidget {
  final CountryData country;

  const CountryDetailsPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        country.countryName,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  country.flags['png']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildDetailRow("Population", country.population.toString()),
            _buildDetailRow("Region", country.region),

            _buildDetailRow(
                "Capital",
                country.capital.isNotEmpty
                    ? country.capital.join(', ')
                    : 'N/A'),
            const SizedBox(height: 25),
            _buildDetailRow("Independence", country.independence),
            _buildDetailRow("Area", "${country.area} km²"),
            // _buildDetailRow("Currency", country.currencies),

            const SizedBox(height: 25),
            _buildDetailRow(
                "Time Zone",
                country.timeZone.isNotEmpty
                    ? country.timeZone.join(', ')
                    : 'N/A'),
            _buildDetailRow("Dialing Code", country.dialingCode),
            _buildDetailRow("Driving Side", country.drivingSide),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
