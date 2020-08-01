import 'package:flutter/material.dart';

isDisplayDesktop(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final width = MediaQuery.of(context).size.width;

  if ((orientation == Orientation.landscape && width > 1000.0) ||
      (orientation == Orientation.portrait && width > 700.0)) {
    return true;
  } else {
    return false;
  }
}
