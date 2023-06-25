import 'package:flutter/material.dart';
import 'colors.dart';


final enableBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: borderColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10.0),
);

final focusedBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: borderColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(10.0),
);


final commonPad = EdgeInsets.only(left: 16.0,right: 16.0, top: 16.0);