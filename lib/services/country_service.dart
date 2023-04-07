import 'dart:convert';

import 'package:phone_test_task/models/country.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static const String _baseUrl =
      'https://restcountries.com/v3.1/all?fields=idd,name,flag';

  Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      final data = json.decode(responseBody) as List<dynamic>;
      return data
          .map((countryJson) => Country.fromJson(countryJson))
          .where((country) => country.countryCallCode!.isNotEmpty)
          .toList();
    } else {
      throw Exception('Could not load the country list');
    }
  }
}
