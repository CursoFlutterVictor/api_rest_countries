//import 'dart:convert';
//import 'dart:developer';

import 'dart:convert';
import 'package:api_rest_countries/models/country_model.dart';
import 'package:http/http.dart' as http;

class ServiceCountriesApi {
  /*
  static void getCountries() {
    var url = Uri.parse("https://restcountries.com/v2/all");
    print(url);
  }*/

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
        var jsonResponse = jsonDecode(response.body);

        print(jsonResponse);

        /*
       final myJson = jsonDecode(respuesta.body);
      Country c = Country.fromJson(myJson.first);
      */

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
}



/*
class ServicesReqResApi {
  void getReqRepService() {
    Person persons = Person();
    var url = Uri.parse("https://reqres.in/api/users?page=2");

    print("URL: $url");

    // Hacemos la llamada a la api
    http.get(url).then((respuesta) {
      print(respuesta.body);

      // Convertimos el JSON en un objeto Person
      persons = Person.fromJson(jsonDecode(respuesta.body));

      // Recorro la lista de personas. Obliga a meter el nullsafety ?
      persons.data?.forEach((element) {
        print(element.email);
      });
      // Seria igual que un try cath
    }).catchError((err) {
      log("ERROR $err");
    });

    print("hola desde mi api");
  }
}
*/