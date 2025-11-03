import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api/countrymodal.dart';


class CountryProvider with ChangeNotifier {
  List<Countries> _countries = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Countries> get countries => _countries;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCountries() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse('https://www.thesportsdb.com/api/v1/json/3/all_countries.php');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final countryModel = countrymodal.fromJson(data);
        _countries = countryModel.countries!;
      } else {
        _errorMessage = 'Failed to load countries (Error: ${response.statusCode})';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
