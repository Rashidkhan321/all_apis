import 'dart:convert';

import 'package:all_apis/api/football/api/countrydeaitl/Antarctica.dart';

import 'coutrydetailsmodal.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class fetchcountrydata with ChangeNotifier{


  List<Team> _countries = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Team> get countries => _countries;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCountries(String query) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse('https://www.thesportsdb.com/api/v1/json/123/searchteams.php?t=$query');


      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final countryModel = CountryDetailModel.fromJson(data);
          _countries = countryModel.teams!;
        } else {
          _errorMessage = 'Failed to load countries (eError: ${response.statusCode})';
        }
      } catch (e) {


        print(e.toString());
        _errorMessage = 'Error: $e';


      }


    _isLoading = false;
    notifyListeners();
  }
}