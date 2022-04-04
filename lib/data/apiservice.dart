import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:restaurantapi/data/restaurant.dart';

class ApiService extends StatelessWidget {
  static const String _list = '/list';
  // static const String _detail = '/detail';
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  const ApiService({Key? key}) : super(key: key);


  Future<Restaurant> getdata() async {
    var data = await http.get(Uri.parse(_baseUrl + _list));

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
