import 'package:flutter/material.dart';
import 'package:ncovid19/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),

      // Other setting option
      debugShowCheckedModeBanner: false,
      title: 'Coronavirus Statistic',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
    );
  }
}
