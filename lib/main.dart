import 'package:flutter/material.dart';
import 'package:weather/Screens/Homepage.dart';
import 'package:weather/Screens/SpleshPage.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const SpleshPage(),
        "home" : (context) => const HomePage(),
      },
    ),
  );
}
