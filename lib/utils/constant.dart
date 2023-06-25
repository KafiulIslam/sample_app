import 'package:flutter/material.dart';
import 'colors.dart';


final enableBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: primaryBackground,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(40),
);

final focusedBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Color(0x00000000),
    width: 2,
  ),
  borderRadius: BorderRadius.circular(40),
);


final commonPad = EdgeInsets.only(left: 16.0,right: 16.0, top: 16.0);