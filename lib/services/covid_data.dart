import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.header);

  final String url;
  final Map<String, String> header;

  Future getData() async {
    http.Response response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

const covid19DataURL = 'https://covid-193.p.rapidapi.com';
const Map<String, String> _headers = {
  "x-rapidapi-host": "covid-193.p.rapidapi.com",
  "x-rapidapi-key": '756a365813mshe3eb7147e6c4256p1002bbjsn9ef5c477857d',
};

class CovidData {
  /// Get all countries available
  Future<dynamic> getCountriesList() async {
    var networkHelper = NetworkHelper('$covid19DataURL/countries', _headers);
    var data = await networkHelper.getData();
    return data;
  }

  /// Get the current status of all countries
  Future<dynamic> getStatistics() async {
    var networkHelper = NetworkHelper('$covid19DataURL/statistics', _headers);
    var data = await networkHelper.getData();
    return data;
  }

  /// Get the current status for a specific country
  Future<dynamic> getStatisticsOfCountry(String country) async {
    var networkHelper =
        NetworkHelper('$covid19DataURL/statistics?country=$country', _headers);
    var data = await networkHelper.getData();
    return data;
  }

  /// Get the current status in the world
  Future<dynamic> getStatisticsWorld() async {
    var networkHelper =
        NetworkHelper('$covid19DataURL/statistics?country=all', _headers);
    var data = await networkHelper.getData();
    return data;
  }

  /// Get the complete historical data of a country
  Future<dynamic> getHistoryOfCountry(String country, [String date]) async {
    var url = "$covid19DataURL/history?country=$country";
    if (date != null) {
      url += "&day=$date";
    }
    var networkHelper = NetworkHelper(url, _headers);
    var data = await networkHelper.getData();
    return data;
  }

  /// Get the complete historical data around the world
  Future<dynamic> getHistoryWorld([String date]) async {
    var url = "$covid19DataURL/history?country=all";
    if (date != null) {
      url += "&day=$date";
    }
    var networkHelper = NetworkHelper(url, _headers);
    var data = await networkHelper.getData();
    return data;
  }
}
