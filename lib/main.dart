import 'package:api_rest_countries/models/country_model.dart';
import 'package:api_rest_countries/services/service_countries.dart';

Future<void> main() async {
  List<Country>? paises = await ServiceCountriesApi.getCountry("Peru");

  if (paises != null) {
    for (var p in paises) {
      print(p.name);
    }
  }
}
