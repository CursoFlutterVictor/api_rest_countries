//import 'dart:convert';
//import 'dart:developer';

import 'dart:convert';
import 'package:api_rest_countries/models/country_model.dart';
import 'package:api_rest_countries/models/country_v3_model.dart';
import 'package:http/http.dart' as http;

class ServiceCountriesApi {
  static Future<List<Country>?> getCountry(String country) async {
    Uri url;

    if (country == "") {
      url = Uri.parse("https://restcountries.com/v2/all");
    } else {
      url = Uri.parse("https://restcountries.com/v2/name/$country");
    }

    try {
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);

        final List<dynamic> bodyDecoded = jsonDecode(response.body);
        final paises = bodyDecoded.map((p) => Country.fromJson(p));
        final List<Country> listaPaises = paises.toList();

        return listaPaises;
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  static Future<List<CountryV3>?> getCountryV3(String country) async {
    Uri url;

    if (country == "") {
      url = Uri.parse("https://restcountries.com/v3/all");
    } else {
      url = Uri.parse("https://restcountries.com/v3/name/$country");
    }

    try {
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);

        final List<dynamic> bodyDecoded = jsonDecode(response.body);
        final paises = bodyDecoded.map((p) => CountryV3.fromJson(p));
        final List<CountryV3> listaPaises = paises.toList();

        return listaPaises;
      }
    } catch (error) {
      print(error);
    }

    return null;
  }
}
