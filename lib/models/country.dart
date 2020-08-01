class Country {
  String name;

  Country({this.name});
}

class Countries {
  List<Country> countriesList;

  Countries({this.countriesList});

  factory Countries.fromJson(Map<String, dynamic> map) {
    List<Country> allCountries = [];
    for (var i = 0; i < map["response"].length; ++i) {
      var countryName = map["response"][i].toString();
      Country country = Country(name: countryName);
      allCountries.add(country);
    }

    return Countries(countriesList: allCountries);
  }
}
