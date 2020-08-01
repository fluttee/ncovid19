import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ncovid19/models/country.dart';
import 'package:ncovid19/models/statistic_world.dart';
import 'package:ncovid19/screens/home_screen.dart';
import 'package:ncovid19/services/covid_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    final data = await CovidData().getStatisticsWorld() as Map<String, dynamic>;
    final statisticWorld = StatisticWorld.fromJson(data);

    final data1 = await CovidData().getCountriesList() as Map<String, dynamic>;
    final countries = Countries.fromJson(data1);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        statisticWorld: statisticWorld,
        countries: countries,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
