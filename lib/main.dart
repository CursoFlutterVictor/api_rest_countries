import 'package:api_rest_countries/models/country_model.dart';
import 'package:api_rest_countries/models/country_v3_model.dart';
import 'package:api_rest_countries/services/service_countries.dart';

Future<void> main() async {
  List<Country>? paises = await ServiceCountriesApi.getCountry("UK");

  if (paises != null) {
    for (var p in paises) {
      print(p.name);
    }
  }

  print("");

  List<CountryV3>? paisesV3 = await ServiceCountriesApi.getCountryV3("");

  if (paisesV3 != null) {
    for (var p in paisesV3) {
      print(p.name?.common);
    }
  }
}
