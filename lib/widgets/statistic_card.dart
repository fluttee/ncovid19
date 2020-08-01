import 'package:flutter/material.dart';
import 'package:ncovid19/utils/constants.dart';
import 'package:ncovid19/widgets/base_card.dart';

class StatisticCard extends StatelessWidget {
  final String caseTitle;
  final bool isUp;
  final String value;
//  final Image chart;

  StatisticCard({
    this.caseTitle,
    this.isUp,
    this.value,
//    this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: kSpacerSmallest,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    caseTitle,
                    style: TextStyle(fontSize: kFontSizeSmallest),
                  ),
                  Icon(
                    isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: isUp ? Colors.red : Colors.green,
                  ),
                ],
              ),
              Text(
                value,
                style: TextStyle(fontSize: kFontSizeSmallest),
              ),
            ],
          ),
          Icon(Icons.show_chart),
//          graph,
        ],
      ),
    );
  }
}
