import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;
  const CustomScaffold({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ));
  }
}
