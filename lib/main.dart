import 'package:api_rest_countries/models/country_model.dart';
import 'package:api_rest_countries/models/country_v3_model.dart';
import 'package:api_rest_countries/services/service_countries.dart';

Future<void> main() async {
  //List<Country>? paises = await ServiceCountriesApi.getCountry("España");
  List<CountryV3>? paises = await ServiceCountriesApi.getCountryV3("");

  if (paises != null) {
    for (var p in paises) {
      //print(p.name);
      print(p.name?.common);
    }
  }
}
