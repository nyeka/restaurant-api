import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:restaurantapi/data/restaurant.dart';

class ApiServive extends StatelessWidget {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'YOUR_API_KEY';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<Restaurant> getdata() async {
    var data = await http.get(Uri.parse(_baseUrl));

    if (data.statusCode == 200) {
      return Restaurant.fromJson(jsonDecode(data.body));
    } else {
      throw Exception('failde to show data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
