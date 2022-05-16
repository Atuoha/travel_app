import 'package:flutter/material.dart';
import 'package:travel_app/screens/details.dart';
import 'screens/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const WelcomePage(),
      routes: {
        Details.routeName: (context) => const Details(),
      },
    );
  }
}
