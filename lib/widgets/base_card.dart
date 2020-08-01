import 'package:flutter/material.dart';
import 'package:ncovid19/utils/constants.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final double padding;

  BaseCard({
    @required this.child,
    this.padding = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Color(kCardColor),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(padding),
    );
  }
}
