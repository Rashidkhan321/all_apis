import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'animalsapimodal.dart';  // make sure this path is correct

class AnimalsProvider with ChangeNotifier {
  animalsmodal? animalsData;
  bool isLoading = false;
  String? errorMessage;

  /// Fetch data from API
  Future<void> fetchAnimals() async {
    final url = Uri.parse('https://extinct-api.herokuapp.com/api/v1/animal/100'); // 🔁 Replace with your API URL

    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        animalsData = animalsmodal.fromJson(jsonData);
      } else {
        errorMessage = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Error: $e';
      if (kDebugMode) {
        print('Error fetching animals: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
