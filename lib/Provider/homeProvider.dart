import 'dart:convert';
import 'dart:developer';

import 'package:covid19/Models/allcountryModel.dart';
import 'package:covid19/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  bool loading = false;
  List<CountryModel> countries = [];

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  Future fetchAllCounty(BuildContext context) async {
    setLoading(true);
    try {
      log('AppApi.getAllCountry: ${AppApi.getAllCountry}');
      final response = await http.get(
        Uri.parse(AppApi.getAllCountry),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );
      log('response: ${response.statusCode}');
      // log('response: ${response.body}');
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var county = body['Countries'];
        countries.clear();
        for (var i in body['Countries']) {
          CountryModel c = CountryModel(
              id: i['ID'].toString(),
              country: i['Country'].toString(),
              countryCode: i['CountryCode'].toString(),
              slug: i['Slug'].toString(),
              newConfirmed: i['NewConfirmed'].toString(),
              totalConfirmed: i['TotalConfirmed'].toString(),
              newDeaths: i['NewDeaths'].toString(),
              totalDeaths: i['TotalDeaths'].toString(),
              newRecovered: i['NewRecovered'].toString(),
              totalRecovered: i['TotalRecovered'].toString(),
              date: i['date'].toString());
          countries.add(c);
        }
        print('countries: $countries');
        setLoading(false);

        return true;
      } else {
        setLoading(false);
        throw Exception('Unexpected error occurred!');
      }
    } catch (e) {
      log('e: $e');
      setLoading(false);
      return false;
    }
  }
}
