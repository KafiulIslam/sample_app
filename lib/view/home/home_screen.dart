import 'package:flutter/material.dart';

import '../../utils/typography.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Text('Sample App', style: title1,)
        ],),
      ),
    ),));
  }
}
