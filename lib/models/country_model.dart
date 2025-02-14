class CountryData {
  final String countryName;
  final List<String> capital;
  final String region;
  final String independence;
  final double area;
  final List<String> timeZone;
  final String dialingCode;
  final String drivingSide;
  final Map<String, dynamic> flags;
  final int population;
  final Map<String, Currency> currencies;
  final Map<String, String> languages;
  final Map<String, Translation> translations;
  final List<String> continents;

  CountryData(
      {required this.countryName,
      required this.capital,
      required this.region,
      required this.independence,
      required this.area,
      required this.timeZone,
      required this.dialingCode,
      required this.drivingSide,
      required this.flags,
      required this.population,
      required this.currencies,
      required this.languages,
      required this.translations,
      required this.continents});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    // Extracting dialing code from `idd`
    String root = json['idd']?['root'] ?? '';
    List<String> suffixes = List<String>.from(json['idd']?['suffixes'] ?? []);
    String dialingCode = root + (suffixes.isNotEmpty ? suffixes.first : '');

    return CountryData(
      countryName: json['name']['common'] ?? '',
      capital:
          (json['capital'] as List?)?.map((e) => e.toString()).toList() ?? [],
      region: json['region'] ?? '',
      area: json['area'] ?? '',
      independence:
          json['independent'] != null ? json['independent'].toString() : '',
      currencies: (json['currencies'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, Currency.fromJson(value)),
          ) ??
          {},
      dialingCode: dialingCode,
      drivingSide: json['driving_side'] ?? 'null',
      languages: (json['languages'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value.toString()),
          ) ??
          {},
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, Translation.fromJson(value)),
          ) ??
          {},
      population: json['population'] ?? 0,
      timeZone: List<String>.from(json['timezones'] ?? []),
      continents: List<String>.from(json['continents'] ?? []),
      flags: (json['flags'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value.toString()),
          ) ??
          {},
    );
  }
}

class Currency {
  final String name;
  final String symbol;

  Currency({required this.name, required this.symbol});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
    );
  }
}

class Translation {
  final String official;
  final String common;

  Translation({required this.official, required this.common});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json['official'] ?? '',
      common: json['common'] ?? '',
    );
  }
}
