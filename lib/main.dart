import 'package:flutter/material.dart';
import 'package:restaurantapi/widget/listdata.dart';
import 'detail/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Alldata()
    );
  }
}