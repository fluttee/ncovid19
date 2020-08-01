import 'package:flutter/material.dart';
import 'package:ncovid19/models/country.dart';
import 'package:ncovid19/models/statistic_world.dart';
import 'package:ncovid19/services/covid_data.dart';
import 'package:ncovid19/utils/constants.dart';
import 'package:ncovid19/widgets/base_card.dart';
import 'package:ncovid19/widgets/statistic_card.dart';

class HomeScreen extends StatefulWidget {
  final StatisticWorld statisticWorld;
  final Countries countries;

  HomeScreen({this.statisticWorld, this.countries});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(kPrimaryColor),
        child: Row(
          children: [
            _buildNavBar(),
            _buildMainScreen(widget.statisticWorld, widget.countries),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var data = CovidData();
          data.getHistoryWorld("2020-07-28");
        },
      ),
    );
  }

  bool _isExpand = true;
  int _selectedIndex = 0;
  _buildNavBar() {
    return Container(
      color: Color(kCardColor),
      height: double.infinity,
      width: _isExpand ? 160.0 : 60.0,
      padding: EdgeInsets.all(kSpacerSmallest),
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 50,
          ),
          SizedBox(height: kSpacerLarge),
          Column(
            children: [
              MaterialButton(
                elevation: 0.0,
                minWidth: 100,
                height: 40,
                padding: EdgeInsets.symmetric(
                    vertical: kSpacerSmallest, horizontal: kSpacerSmallest),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kRadiusMedium)),
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: _isExpand
                    ? Row(
                        children: [
                          Image.asset(
                            "assets/images/navbar_dashboard.png",
                            width: 15,
                            color: _selectedIndex == 0
                                ? Color(kNavBarSelectedColor)
                                : Colors.grey,
                          ),
                          if (_isExpand)
                            Padding(
                              padding: EdgeInsets.only(left: kSpacerSmallest),
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Color(kNavBarSelectedColor)
                                      : Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                        ],
                      )
                    : Image.asset(
                        "assets/images/navbar_dashboard.png",
                        width: 15,
                        color: _selectedIndex == 0
                            ? Color(kNavBarSelectedColor)
                            : Colors.grey,
                      ),
              ),
              MaterialButton(
                elevation: 0.0,
                minWidth: 100,
                height: 40,
                padding: EdgeInsets.symmetric(
                    vertical: kSpacerSmallest, horizontal: kSpacerSmallest),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kRadiusMedium)),
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: _isExpand
                    ? Row(
                        children: [
                          Image.asset(
                            "assets/images/navbar_symptoms.png",
                            width: 15,
                            color: _selectedIndex == 1
                                ? Color(kNavBarSelectedColor)
                                : Colors.grey,
                          ),
                          if (_isExpand)
                            Padding(
                              padding: EdgeInsets.only(left: kSpacerSmallest),
                              child: Text(
                                "Symptoms",
                                style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? Color(kNavBarSelectedColor)
                                      : Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                        ],
                      )
                    : Image.asset(
                        "assets/images/navbar_symptoms.png",
                        width: 15,
                        color: _selectedIndex == 1
                            ? Color(kNavBarSelectedColor)
                            : Colors.grey,
                      ),
              ),
              MaterialButton(
                elevation: 0.0,
                minWidth: 100,
                height: 40,
                padding: EdgeInsets.symmetric(
                    vertical: kSpacerSmallest, horizontal: kSpacerSmallest),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kRadiusMedium)),
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: _isExpand
                    ? Row(
                        children: [
                          Image.asset(
                            "assets/images/navbar_laboratory.png",
                            width: 15,
                            color: _selectedIndex == 2
                                ? Color(kNavBarSelectedColor)
                                : Colors.grey,
                          ),
                          if (_isExpand)
                            Padding(
                              padding: EdgeInsets.only(left: kSpacerSmallest),
                              child: Text(
                                "Laboratory",
                                style: TextStyle(
                                  color: _selectedIndex == 2
                                      ? Color(kNavBarSelectedColor)
                                      : Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                        ],
                      )
                    : Image.asset(
                        "assets/images/navbar_laboratory.png",
                        width: 15,
                        color: _selectedIndex == 2
                            ? Color(kNavBarSelectedColor)
                            : Colors.grey,
                      ),
              ),
            ],
          ),
          Spacer(),
          MaterialButton(
            elevation: 0.0,
            minWidth: 100,
            height: 40,
            padding: EdgeInsets.symmetric(
                vertical: kSpacerSmallest, horizontal: kSpacerSmallest),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kRadiusMedium)),
            ),
            onPressed: () {
              setState(() {
                _isExpand = !_isExpand;
              });
            },
            child: _isExpand
                ? Row(
                    children: [
                      Image.asset(
                        "assets/images/navbar_sidebar.png",
                        width: 15,
                        color: Colors.grey,
                      ),
                      if (_isExpand)
                        Padding(
                          padding: EdgeInsets.only(left: kSpacerSmallest),
                          child: Text(
                            "Toggle Sidebar",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                    ],
                  )
                : Image.asset(
                    "assets/images/navbar_sidebar.png",
                    width: 15,
                    color: Colors.grey,
                  ),
          )
        ],
      ),
    );
  }

  _buildMainScreen(StatisticWorld statisticWorld, Countries countries) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(kSpacerSmallest),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(kPrimaryColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kRadiusLarge),
            bottomLeft: Radius.circular(kRadiusLarge),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatisticCard(
                          caseTitle: "Total Cases",
                          value: statisticWorld.caseTotal.toString(),
                          isUp: true,
                        ),
                        StatisticCard(
                          caseTitle: "Recovered",
                          value: statisticWorld.caseRecovered.toString(),
                          isUp: false,
                        ),
                        StatisticCard(
                          caseTitle: "Active Cases",
                          value: statisticWorld.caseActive.toString(),
                          isUp: false,
                        ),
                        StatisticCard(
                          caseTitle: "Total Death",
                          value: statisticWorld.caseDeath.toString(),
                          isUp: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpacerSmallest),
                  Expanded(
                    flex: 5,
                    child: BaseCard(
                      padding: kSpacerSmallest,
                      child: Column(
                        children: [
//                          TextField(
//                            controller: _controller,
//                            decoration: InputDecoration(
//                              labelText: "Search",
//                              hintText: "Search",
//                              prefixIcon: Icon(Icons.search),
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.all(
//                                  Radius.circular(kRadiusLarge),
//                                ),
//                              ),
//                            ),
//                            onChanged: (value) {
////                              filterSearchResults(data, value);
//                            },
//                          ),
                          Flexible(
                            child: ListView.builder(
                              itemCount: countries.countriesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(
                                  countries.countriesList[index].name,
                                  style: TextStyle(fontSize: kFontSizeSmallest),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseCard(
                          child: Text("main"),
                        ),
                        BaseCard(
                          child: Text("main"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BaseCard(
                    child: Text("right"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
