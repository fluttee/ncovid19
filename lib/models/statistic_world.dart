class StatisticWorld {
  String caseNew;
  String caseActive;
  String caseCritical;
  String caseRecovered;
  String caseTotal;
  String caseDeath;
  String caseDeathNew;

  StatisticWorld({
    this.caseNew,
    this.caseActive,
    this.caseCritical,
    this.caseRecovered,
    this.caseTotal,
    this.caseDeath,
    this.caseDeathNew,
  });

  factory StatisticWorld.fromJson(Map<String, dynamic> map) {
    return StatisticWorld(
      caseNew: map["response"][0]["cases"]["new"].toString(),
      caseActive: map["response"][0]["cases"]["active"].toString(),
      caseCritical: map["response"][0]["cases"]["critical"].toString(),
      caseRecovered: map["response"][0]["cases"]["recovered"].toString(),
      caseTotal: map["response"][0]["cases"]["total"].toString(),
      caseDeath: map["response"][0]["deaths"]["total"].toString(),
      caseDeathNew: map["response"][0]["deaths"]["new"].toString(),
    );
  }
}
